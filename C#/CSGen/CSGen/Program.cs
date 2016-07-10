namespace CSGen
{
    using System;
    using System.Collections.Generic;
    using System.Windows.Forms;
    using CSGen.Code;

    internal static class Program
    {
        public static bool configProgram;
        public static bool createSolution;
        public static bool execProc;
        public static string outputPath;
        public static string prefixNamespace;
        public static List<SqlTable> SqlTableList;
        public static string stringConexao;
        public static string stringRemoveClass;
        public static string stringRemoveProc;
        public static string sulfixDelete;
        public static string sulfixInsert;
        public static string sulfixSelect;
        public static string tableStartWith;
        public static string webConfigConnection;

        [STAThread]
        private static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Principal());
        }
    }
}

