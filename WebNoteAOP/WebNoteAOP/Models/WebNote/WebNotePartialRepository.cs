//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

#if !DO_NOT_USE_UNITY
// Download Unity 1.2: http://unity.codeplex.com/releases/view/18855
//                     http://msdn.microsoft.com/en-us/library/dd203104.aspx
// Name: Microsoft.Practices.Unity
// Path: %ProgramFiles(x86)%\Microsoft Unity Application Block 1.2\Bin
using Microsoft.Practices.Unity;
#endif

namespace WebNoteAOP.Models.WebNote
{
    /// <summary>Repository</summary>
    [System.CodeDom.Compiler.GeneratedCode("ADO.NET Unit Testable Repository Generator", "0.5")]
    public partial class WebNoteRepository
    {
    
        /// <summary>
        /// Gets or sets the specialised object context
        /// </summary>
        /// <value>object context</value>
    	#if !DO_NOT_USE_UNITY
        [Dependency]
    	#endif
        public IWebNote Context { get; set; }
    }
}
