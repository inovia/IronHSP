using System;
using Microsoft.VisualStudio.Workspace;
using Microsoft.VisualStudio.Workspace.Debug;

namespace NhspVsLanguageClient
{
    // Hooks us into the VS 2022 Open-Folder "Startup Items" dropdown shown
    // next to the Debug toolbar. Registering ExportLaunchDebugTarget for
    // .nhsp makes VS surface "Current Document (xxx.nhsp)" whenever a .nhsp
    // file is active and no solution is loaded — clicking ▶ then fires
    // LaunchDebugTarget below instead of the "Select startup item" dialog.
    //
    // Pattern mirrors PTVS (Python/Product/Workspace/*LaunchDebugTargetProvider.cs).
    // Pure MEF — no AsyncPackage or VSCT.
    [ExportLaunchDebugTarget(ProviderType, new[] { ".nhsp" })]
    internal sealed class NhspLaunchDebugTargetProvider : ILaunchDebugTargetProvider
    {
        internal const string ProviderType = "7C2D9F3F-4C2E-4E7E-8A3B-9A2D1F0E3B42";
        internal const string LaunchTypeName = "nhsp";

        // Workspace fills "target" with the active document path when the
        // user picks "Current Document (xxx.nhsp)".
        internal const string TargetKey = "target";
        internal const string NoDebugKey = "noDebug";

        internal const string JsonSchema = @"{
  ""definitions"": {
    ""nhsp"": {
      ""type"": ""object"",
      ""properties"": {
        ""type"": { ""type"": ""string"", ""enum"": [ ""nhsp"" ] }
      }
    },
    ""nhspFile"": {
      ""allOf"": [
        { ""$ref"": ""#/definitions/default"" },
        { ""$ref"": ""#/definitions/nhsp"" }
      ]
    }
  },
  ""defaults"": {
    "".nhsp"": { ""$ref"": ""#/definitions/nhsp"" }
  },
  ""configuration"": ""#/definitions/nhspFile""
}";

        public void LaunchDebugTarget(
            IWorkspace workspace,
            IServiceProvider serviceProvider,
            DebugLaunchActionContext ctx)
        {
            var settings = ctx.LaunchConfiguration;
            string target = settings.GetValue(TargetKey, string.Empty);
            if (string.IsNullOrEmpty(target))
                throw new InvalidOperationException("NHSP launch: no target file.");

            // `target` from the workspace may be relative to the workspace root.
            if (workspace != null && !System.IO.Path.IsPathRooted(target))
                target = workspace.MakeRooted(target);

            bool noDebug = settings.GetValue(NoDebugKey, false);
            NhspDebugLauncher.LaunchFilePublic(target, debug: !noDebug);
        }

        public bool SupportsContext(IWorkspace workspace, string filePath)
        {
            // PTVS throws NotImplementedException here — the callback is not
            // invoked for file-extension-based providers, but VS still needs
            // it defined.
            throw new NotImplementedException();
        }
    }

    // Tells VS the default JSON shape for a .nhsp launch configuration. The
    // schema above + this provider is what makes the toolbar show "Current
    // Document (xxx.nhsp)" as an auto-generated startup item.
    [ExportLaunchConfigurationProvider(
        ProviderType,
        new[] { ".nhsp" },
        NhspLaunchDebugTargetProvider.LaunchTypeName,
        NhspLaunchDebugTargetProvider.JsonSchema)]
    internal sealed class NhspLaunchConfigurationProvider : ILaunchConfigurationProvider
    {
        internal const string ProviderType = "A4E2B118-5A33-4A21-A3E1-DA2F66E9F1C5";

        public bool IsDebugLaunchActionSupported(DebugLaunchActionContext ctx) => true;

        public void CustomizeLaunchConfiguration(
            DebugLaunchActionContext ctx,
            IPropertySettings launchSettings)
        {
            // Nothing extra to stamp in by default — NhspLaunchDebugTarget
            // only needs "target", which the workspace fills itself.
        }
    }
}
