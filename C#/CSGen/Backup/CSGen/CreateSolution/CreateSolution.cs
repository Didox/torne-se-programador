namespace CSGen.CreateSolution
{
    using CSGen;
    using System;
    using System.IO;
    using System.Text;

    public class CreateSolution
    {
        private string strGuidBusiness;
        private string strGuidDatabase;

        public CreateSolution(string guidDataBase, string guidBusiness)
        {
            this.strGuidDatabase = guidDataBase.ToUpper();
            this.strGuidBusiness = guidBusiness.ToUpper();
        }

        public void Build()
        {
            StringBuilder builder = new StringBuilder();
            string[] strArray = new string[] { Guid.NewGuid().ToString().ToUpper(), Guid.NewGuid().ToString().ToUpper(), Guid.NewGuid().ToString().ToUpper() };
            builder.AppendLine();
            builder.AppendLine("Microsoft Visual Studio Solution File, Format Version 9.00");
            builder.AppendLine("# Visual Studio 2005");
            builder.AppendLine("Project(\"{" + strArray[0] + "}\") = \"" + TipoProjeto.DataBase.ToString() + "\", \"" + TipoProjeto.DataBase.ToString() + @"\" + TipoProjeto.DataBase.ToString() + ".csproj\", \"{" + this.strGuidDatabase + "}\"");
            builder.AppendLine("EndProject");
            builder.AppendLine("Project(\"{" + strArray[0] + "}\") = \"" + TipoProjeto.Business.ToString() + "\", \"" + TipoProjeto.Business.ToString() + @"\" + TipoProjeto.Business.ToString() + ".csproj\", \"{" + this.strGuidBusiness + "}\"");
            builder.AppendLine("EndProject");
            builder.AppendLine("Global");
            builder.AppendLine(this.Tab(1) + "GlobalSection(SolutionConfigurationPlatforms) = preSolution");
            builder.AppendLine(this.Tab(2) + "Debug|Any CPU = Debug|Any CPU");
            builder.AppendLine(this.Tab(2) + "Release|Any CPU = Release|Any CPU");
            builder.AppendLine(this.Tab(1) + "EndGlobalSection");
            builder.AppendLine(this.Tab(1) + "GlobalSection(ProjectConfigurationPlatforms) = postSolution");
            builder.AppendLine(this.Tab(2) + "{" + strArray[1] + "}.Debug|Any CPU.ActiveCfg = Debug|Any CPU");
            builder.AppendLine(this.Tab(2) + "{" + strArray[1] + "}.Debug|Any CPU.Build.0 = Debug|Any CPU");
            builder.AppendLine(this.Tab(2) + "{" + strArray[1] + "}.Release|Any CPU.ActiveCfg = Release|Any CPU");
            builder.AppendLine(this.Tab(2) + "{" + strArray[1] + "}.Release|Any CPU.Build.0 = Release|Any CPU");
            builder.AppendLine(this.Tab(2) + "{" + strArray[2] + "}.Debug|Any CPU.ActiveCfg = Debug|Any CPU");
            builder.AppendLine(this.Tab(2) + "{" + strArray[2] + "}.Debug|Any CPU.Build.0 = Debug|Any CPU");
            builder.AppendLine(this.Tab(2) + "{" + strArray[2] + "}.Release|Any CPU.ActiveCfg = Release|Any CPU");
            builder.AppendLine(this.Tab(2) + "{" + strArray[2] + "}.Release|Any CPU.Build.0 = Release|Any CPU");
            builder.AppendLine(this.Tab(1) + "EndGlobalSection");
            builder.AppendLine(this.Tab(2) + "GlobalSection(SolutionProperties) = preSolution");
            builder.AppendLine(this.Tab(1) + "HideSolutionNode = FALSE");
            builder.AppendLine(this.Tab(1) + "EndGlobalSection");
            builder.AppendLine("EndGlobal");
            string outputPath = Program.outputPath;
            if (!Directory.Exists(outputPath))
            {
                Directory.CreateDirectory(outputPath);
            }
            StreamWriter writer = new StreamWriter(outputPath + @"\CSGenSolution.sln");
            writer.Write(builder.ToString());
            writer.Flush();
            writer.Close();
            writer.Dispose();
        }

        private string Tab(int qtde)
        {
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < qtde; i++)
            {
                builder.Append("\t");
            }
            return builder.ToString();
        }
    }
}

