using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace NhspCompiler.Core.Emit
{
    // Builds a Win32 .res byte blob suitable for AssemblyBuilder.DefineUnmanagedResource(byte[]).
    // Supports embedding a single .ico (fanned out as RT_ICON + RT_GROUP_ICON).
    // Supports embedding a .manifest as RT_MANIFEST.
    internal static class Win32ResBuilder
    {
        private const ushort RT_ICON = 3;
        private const ushort RT_GROUP_ICON = 14;
        private const ushort RT_MANIFEST = 24;
        private const ushort LANG_NEUTRAL = 0;
        private const ushort MEMFLAG_DEFAULT = 0x1030; // MOVEABLE | PURE | DISCARDABLE
        private const ushort CREATEPROCESS_MANIFEST_RESOURCE_ID = 1;

        // icoBytes: raw .ico file bytes (already converted from any source format)
        public static byte[] Build(byte[] icoBytes, string manifestPath)
        {
            using (var ms = new MemoryStream())
            {
                // First resource entry in a .res must be the empty header ("null entry").
                WriteNullEntry(ms);

                if (icoBytes != null && icoBytes.Length >= 6)
                    AppendIcon(ms, icoBytes);

                if (!string.IsNullOrEmpty(manifestPath) && File.Exists(manifestPath))
                    AppendManifest(ms, manifestPath);

                return ms.ToArray();
            }
        }

        private static void WriteNullEntry(Stream s)
        {
            var w = new BinaryWriter(s);
            w.Write((uint)0);        // DataSize
            w.Write((uint)0x20);     // HeaderSize
            w.Write((ushort)0xFFFF); w.Write((ushort)0); // Type ordinal 0
            w.Write((ushort)0xFFFF); w.Write((ushort)0); // Name ordinal 0
            w.Write((uint)0);        // DataVersion
            w.Write((ushort)0);      // MemoryFlags
            w.Write((ushort)0);      // LanguageId
            w.Write((uint)0);        // Version
            w.Write((uint)0);        // Characteristics
        }

        private static void AppendIcon(Stream s, byte[] ico)
        {
            if (ico == null || ico.Length < 6) return;

            // ICONDIR: Reserved(2)=0, Type(2)=1 (icon), Count(2)=N
            ushort type = BitConverter.ToUInt16(ico, 2);
            ushort count = BitConverter.ToUInt16(ico, 4);
            if (type != 1 || count == 0) return;

            // Parse N ICONDIRENTRYs (16 bytes each starting at offset 6).
            var entries = new List<IconEntry>(count);
            for (int i = 0; i < count; i++)
            {
                int off = 6 + i * 16;
                if (off + 16 > ico.Length) return;
                var e = new IconEntry
                {
                    Width      = ico[off + 0],
                    Height     = ico[off + 1],
                    ColorCount = ico[off + 2],
                    Reserved   = ico[off + 3],
                    Planes     = BitConverter.ToUInt16(ico, off + 4),
                    BitCount   = BitConverter.ToUInt16(ico, off + 6),
                    BytesInRes = BitConverter.ToUInt32(ico, off + 8),
                    ImageOffset = BitConverter.ToUInt32(ico, off + 12),
                };
                entries.Add(e);
            }

            // Write each image as an RT_ICON with IDs 1..N.
            for (int i = 0; i < entries.Count; i++)
            {
                var e = entries[i];
                if (e.ImageOffset + e.BytesInRes > ico.Length) return;
                byte[] data = new byte[e.BytesInRes];
                Array.Copy(ico, (int)e.ImageOffset, data, 0, (int)e.BytesInRes);
                WriteResourceEntry(s, RT_ICON, (ushort)(i + 1), data);
            }

            // Build the RT_GROUP_ICON directory data:
            //   GRPICONDIR: Reserved(2)=0, Type(2)=1, Count(2)=N
            //   GRPICONDIRENTRY[] : 14 bytes each (differs from ICONDIRENTRY by last field)
            using (var gms = new MemoryStream())
            {
                var gw = new BinaryWriter(gms);
                gw.Write((ushort)0);
                gw.Write((ushort)1);
                gw.Write((ushort)entries.Count);
                for (int i = 0; i < entries.Count; i++)
                {
                    var e = entries[i];
                    gw.Write(e.Width);
                    gw.Write(e.Height);
                    gw.Write(e.ColorCount);
                    gw.Write(e.Reserved);
                    gw.Write(e.Planes);
                    gw.Write(e.BitCount);
                    gw.Write(e.BytesInRes);
                    gw.Write((ushort)(i + 1)); // references RT_ICON id
                }
                WriteResourceEntry(s, RT_GROUP_ICON, 1, gms.ToArray());
            }
        }

        private static void AppendManifest(Stream s, string manifestPath)
        {
            byte[] data = File.ReadAllBytes(manifestPath);
            WriteResourceEntry(s, RT_MANIFEST, CREATEPROCESS_MANIFEST_RESOURCE_ID, data);
        }

        // Write one RESOURCEHEADER + data (DWORD-aligned).
        private static void WriteResourceEntry(Stream s, ushort typeId, ushort nameId, byte[] data)
        {
            var w = new BinaryWriter(s);
            // DataSize is the raw data length; header fields are fixed 0x20 bytes (no custom name/type strings).
            w.Write((uint)data.Length);
            w.Write((uint)0x20);                 // HeaderSize
            w.Write((ushort)0xFFFF); w.Write(typeId);
            w.Write((ushort)0xFFFF); w.Write(nameId);
            w.Write((uint)0);                    // DataVersion
            w.Write((ushort)MEMFLAG_DEFAULT);    // MemoryFlags
            w.Write((ushort)LANG_NEUTRAL);       // LanguageId
            w.Write((uint)0);                    // Version
            w.Write((uint)0);                    // Characteristics
            w.Write(data);
            // Align data to 4 bytes.
            int pad = (4 - (data.Length & 3)) & 3;
            for (int i = 0; i < pad; i++) w.Write((byte)0);
        }

        private struct IconEntry
        {
            public byte Width;
            public byte Height;
            public byte ColorCount;
            public byte Reserved;
            public ushort Planes;
            public ushort BitCount;
            public uint BytesInRes;
            public uint ImageOffset;
        }
    }
}
