using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace NhspCompiler.Core.Emit
{
    // Convert any GDI+-readable image (png/bmp/gif/jpeg/tiff/...) into an .ico
    // byte blob that contains multiple PNG-encoded entries (Vista+ format).
    // Windows decodes PNG payload by magic bytes, so this is the simplest path
    // that avoids hand-rolling a 32bpp DIB + AND mask encoder.
    internal static class ImageToIco
    {
        // Order does not matter to Windows, but smaller-first matches what most
        // tools (rc.exe, csc /win32icon) emit.
        private static readonly int[] Sizes = { 16, 32, 48, 256 };

        public static byte[] Convert(string path)
        {
            using (var src = Image.FromFile(path))
            {
                var pngs = new byte[Sizes.Length][];
                for (int i = 0; i < Sizes.Length; i++)
                    pngs[i] = ResizeToPng(src, Sizes[i]);

                using (var ms = new MemoryStream())
                {
                    var w = new BinaryWriter(ms);
                    // ICONDIR
                    w.Write((ushort)0);              // Reserved
                    w.Write((ushort)1);              // Type = icon
                    w.Write((ushort)Sizes.Length);   // Count

                    int dataOffset = 6 + 16 * Sizes.Length;
                    for (int i = 0; i < Sizes.Length; i++)
                    {
                        int sz = Sizes[i];
                        // 256 is encoded as 0 in the 1-byte width/height fields.
                        w.Write((byte)(sz >= 256 ? 0 : sz));
                        w.Write((byte)(sz >= 256 ? 0 : sz));
                        w.Write((byte)0);   // ColorCount (0 = >= 256 colors)
                        w.Write((byte)0);   // Reserved
                        w.Write((ushort)1); // Planes
                        w.Write((ushort)32); // BitCount
                        w.Write((uint)pngs[i].Length);
                        w.Write((uint)dataOffset);
                        dataOffset += pngs[i].Length;
                    }
                    for (int i = 0; i < Sizes.Length; i++)
                        w.Write(pngs[i]);
                    return ms.ToArray();
                }
            }
        }

        private static byte[] ResizeToPng(Image src, int size)
        {
            using (var bmp = new Bitmap(size, size, PixelFormat.Format32bppArgb))
            {
                using (var g = Graphics.FromImage(bmp))
                {
                    g.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    g.SmoothingMode = SmoothingMode.HighQuality;
                    g.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    g.CompositingQuality = CompositingQuality.HighQuality;
                    g.Clear(Color.Transparent);
                    g.DrawImage(src, new Rectangle(0, 0, size, size));
                }
                using (var ms = new MemoryStream())
                {
                    bmp.Save(ms, ImageFormat.Png);
                    return ms.ToArray();
                }
            }
        }

        public static bool IsSupportedExtension(string ext)
        {
            if (string.IsNullOrEmpty(ext)) return false;
            switch (ext.ToLowerInvariant())
            {
                case ".png":
                case ".bmp":
                case ".gif":
                case ".jpg":
                case ".jpeg":
                case ".tif":
                case ".tiff":
                    return true;
                default:
                    return false;
            }
        }
    }
}
