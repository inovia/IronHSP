using System.Text;

namespace Hsp3Dx.Sjis2Utf8;

/// <summary>
/// .hsp ソースファイルを Shift-JIS → UTF-8 (BOM なし) に一括変換する。
/// hsp3dx ランタイムは UTF-8 固定なので、既存の SJIS ソースを移行するために使う。
///
/// 使い方:
///   hsp3dx_sjis2utf8 --in src.hsp [--out dst.hsp]
///   hsp3dx_sjis2utf8 --dir path\to\project [--recursive]
///   hsp3dx_sjis2utf8 --dir path\to\project --dry-run
/// </summary>
public static class Program
{
    public static int Main(string[] args)
    {
        Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);

        var opts = ParseArgs(args);
        if (opts is null) { PrintUsage(); return 1; }

        try
        {
            if (opts.SingleFile is not null)
            {
                var dst = opts.OutputFile ?? opts.SingleFile;
                return ConvertFile(opts.SingleFile, dst, opts.DryRun) ? 0 : 2;
            }
            if (opts.Directory is not null)
            {
                return ConvertDirectory(opts.Directory, opts.Recursive, opts.DryRun);
            }
            PrintUsage();
            return 1;
        }
        catch (Exception e)
        {
            Console.Error.WriteLine($"error: {e.Message}");
            return 3;
        }
    }

    private static bool ConvertFile(string src, string dst, bool dryRun)
    {
        var bytes = File.ReadAllBytes(src);

        if (LooksLikeUtf8(bytes))
        {
            Console.WriteLine($"skip (already UTF-8): {src}");
            return true;
        }

        var sjis = Encoding.GetEncoding("shift_jis");
        string decoded;
        try { decoded = sjis.GetString(bytes); }
        catch (DecoderFallbackException)
        {
            Console.Error.WriteLine($"error: cannot decode as Shift-JIS: {src}");
            return false;
        }

        var utf8NoBom = new UTF8Encoding(encoderShouldEmitUTF8Identifier: false);
        if (dryRun)
        {
            Console.WriteLine($"[dry-run] would convert: {src} ({bytes.Length} B SJIS) → {utf8NoBom.GetByteCount(decoded)} B UTF-8");
            return true;
        }

        File.WriteAllBytes(dst, utf8NoBom.GetBytes(decoded));
        Console.WriteLine($"converted: {src} → {dst}");
        return true;
    }

    private static int ConvertDirectory(string dir, bool recursive, bool dryRun)
    {
        var opt = recursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
        var targets = new List<string>();
        foreach (var ext in new[] { "*.hsp", "*.as" })
            targets.AddRange(Directory.EnumerateFiles(dir, ext, opt));

        int ok = 0, ng = 0;
        foreach (var f in targets)
        {
            if (ConvertFile(f, f, dryRun)) ok++; else ng++;
        }
        Console.WriteLine($"done: {ok} converted/skipped, {ng} failed");
        return ng == 0 ? 0 : 2;
    }

    /// <summary>
    /// UTF-8 らしいかをヒューリスティック判定する。BOM 有無と、連続バイト列が
    /// 正規 UTF-8 シーケンスとして成立するかをチェック。Shift-JIS との誤判別を
    /// 避けるため、ASCII しかない場合は true (変換不要) とみなす。
    /// </summary>
    private static bool LooksLikeUtf8(ReadOnlySpan<byte> bytes)
    {
        if (bytes.Length >= 3 && bytes[0] == 0xEF && bytes[1] == 0xBB && bytes[2] == 0xBF) return true;

        bool hasMulti = false;
        int i = 0;
        while (i < bytes.Length)
        {
            byte b = bytes[i];
            if (b < 0x80) { i++; continue; }
            hasMulti = true;
            int need;
            if ((b & 0xE0) == 0xC0) need = 1;
            else if ((b & 0xF0) == 0xE0) need = 2;
            else if ((b & 0xF8) == 0xF0) need = 3;
            else return false;
            if (i + need >= bytes.Length) return false;
            for (int k = 1; k <= need; k++)
                if ((bytes[i + k] & 0xC0) != 0x80) return false;
            i += need + 1;
        }
        return hasMulti;
    }

    private sealed class Options
    {
        public string? SingleFile;
        public string? OutputFile;
        public string? Directory;
        public bool Recursive;
        public bool DryRun;
    }

    private static Options? ParseArgs(string[] args)
    {
        var o = new Options();
        for (int i = 0; i < args.Length; i++)
        {
            switch (args[i])
            {
                case "--in":        o.SingleFile = args[++i]; break;
                case "--out":       o.OutputFile = args[++i]; break;
                case "--dir":       o.Directory  = args[++i]; break;
                case "--recursive": o.Recursive  = true;      break;
                case "--dry-run":   o.DryRun     = true;      break;
                case "-h":
                case "--help":      return null;
                default: Console.Error.WriteLine($"unknown arg: {args[i]}"); return null;
            }
        }
        if (o.SingleFile is null && o.Directory is null) return null;
        return o;
    }

    private static void PrintUsage()
    {
        Console.Error.WriteLine("usage:");
        Console.Error.WriteLine("  hsp3dx_sjis2utf8 --in src.hsp [--out dst.hsp] [--dry-run]");
        Console.Error.WriteLine("  hsp3dx_sjis2utf8 --dir path [--recursive] [--dry-run]");
    }
}
