using System.ComponentModel.Composition;
using Microsoft.VisualStudio.LanguageServer.Client;
using Microsoft.VisualStudio.Utilities;

namespace NhspVsLanguageClient
{
    // Declare a "nhsp" content type and bind the .nhsp file extension to it.
    //
    // The BaseDefinition is CodeRemoteContentDefinition.CodeRemoteContentTypeName,
    // the LSP-specific transparent base the Microsoft VSSDK LanguageServerProtocol
    // sample uses. Plain `"code"` routes .nhsp to the generic code editor which
    // preempts the TextMate grammar; the LSP remote base lets TextMate colorize
    // the buffer AND keeps the content type that our ILanguageClient binds to.
#pragma warning disable 649
    public static class NhspContentDefinition
    {
        public const string ContentTypeName = "nhsp";

        [Export]
        [Name(ContentTypeName)]
        [BaseDefinition(CodeRemoteContentDefinition.CodeRemoteContentTypeName)]
        internal static ContentTypeDefinition NhspContentType;

        [Export]
        [FileExtension(".nhsp")]
        [ContentType(ContentTypeName)]
        internal static FileExtensionToContentTypeDefinition NhspFileExtension;
    }
#pragma warning restore 649
}
