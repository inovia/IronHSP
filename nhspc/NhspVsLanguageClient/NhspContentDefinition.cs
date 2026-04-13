using System.ComponentModel.Composition;
using Microsoft.VisualStudio.Utilities;

namespace NhspVsLanguageClient
{
    // Declare a "nhsp" content type and bind the .nhsp file extension to it.
    // This is what makes VS 2022 route .nhsp files to our ILanguageClient.
    public static class NhspContentDefinition
    {
        public const string ContentTypeName = "nhsp";

        [Export]
        [Name(ContentTypeName)]
        [BaseDefinition("code")]
        internal static ContentTypeDefinition NhspContentType { get; set; }

        [Export]
        [FileExtension(".nhsp")]
        [ContentType(ContentTypeName)]
        internal static FileExtensionToContentTypeDefinition NhspFileExtension { get; set; }
    }
}
