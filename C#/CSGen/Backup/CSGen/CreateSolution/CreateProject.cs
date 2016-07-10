namespace CSGen.CreateSolution
{
    using CSGen;
    using CSGen.Code;
    using System;
    using System.IO;
    using System.Text;

    public class CreateProject
    {
        private TipoProjeto directoryType;
        public string stringDataBaseGuide;
        public string stringGuid;

        public CreateProject(TipoProjeto directorytype)
        {
            this.directoryType = directorytype;
            this.stringGuid = Guid.NewGuid().ToString();
        }

        public void Build()
        {
            string str = this.CreateStringBody();
            string str2 = this.CreateStringAssemblyInfo();
            string path = Program.outputPath + @"\" + this.directoryType.ToString();
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            StreamWriter writer = new StreamWriter(path + @"\" + this.directoryType.ToString() + ".csproj");
            writer.Write(str);
            writer.Flush();
            writer.Close();
            writer.Dispose();
            path = Program.outputPath + @"\" + this.directoryType.ToString() + @"\Properties";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            StreamWriter writer2 = new StreamWriter(path + @"\AssemblyInfo.cs");
            writer2.Write(str2);
            writer2.Flush();
            writer2.Close();
            writer2.Dispose();
        }

        private string CreateStringAssemblyInfo()
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine("using System.Reflection;");
            builder.AppendLine("using System.Runtime.CompilerServices;");
            builder.AppendLine("using System.Runtime.InteropServices;");
            builder.AppendLine("");
            builder.AppendLine("[assembly: AssemblyTitle(\"" + this.directoryType + "\")]");
            builder.AppendLine("[assembly: AssemblyDescription(\"\")]");
            builder.AppendLine("[assembly: AssemblyConfiguration(\"\")]");
            builder.AppendLine("[assembly: AssemblyCompany(\"CSGen\")]");
            builder.AppendLine("[assembly: AssemblyProduct(\"CSGen\")]");
            builder.AppendLine("[assembly: AssemblyCopyright(\"Copyright \x00a9 Didox 2008\")]");
            builder.AppendLine("[assembly: AssemblyTrademark(\"\")]");
            builder.AppendLine("[assembly: AssemblyCulture(\"\")]");
            builder.AppendLine("");
            builder.AppendLine("[assembly: ComVisible(false)]");
            builder.AppendLine("");
            builder.AppendLine("[assembly: Guid(\"" + Guid.NewGuid().ToString() + "\")]");
            builder.AppendLine("");
            builder.AppendLine("[assembly: AssemblyVersion(\"1.0.0.0\")]");
            builder.AppendLine("[assembly: AssemblyFileVersion(\"1.0.0.0\")]");
            return builder.ToString();
        }

        private string CreateStringBody()
        {
            StringBuilder builder = new StringBuilder();
            builder.AppendLine(this.Tab(1) + "<Project DefaultTargets=\"Build\" xmlns=\"http://schemas.microsoft.com/developer/msbuild/2003\">");
            builder.AppendLine(this.Tab(2) + "<PropertyGroup>");
            builder.AppendLine(this.Tab(3) + "<Configuration Condition=\" '$(Configuration)' == '' \">Debug</Configuration>");
            builder.AppendLine(this.Tab(3) + "<Platform Condition=\" '$(Platform)' == '' \">AnyCPU</Platform>");
            builder.AppendLine(this.Tab(3) + "<ProductVersion>8.0.50727</ProductVersion>");
            builder.AppendLine(this.Tab(3) + "<SchemaVersion>2.0</SchemaVersion>");
            builder.AppendLine(this.Tab(3) + "<ProjectGuid>{" + this.stringGuid + "}</ProjectGuid>");
            builder.AppendLine(this.Tab(3) + "<OutputType>Library</OutputType>");
            builder.AppendLine(this.Tab(3) + "<AppDesignerFolder>Properties</AppDesignerFolder>");
            builder.AppendLine(this.Tab(3) + "<RootNamespace>" + Program.prefixNamespace + "." + this.directoryType.ToString() + "</RootNamespace>");
            builder.AppendLine(this.Tab(3) + "<AssemblyName>" + Program.prefixNamespace + "." + this.directoryType.ToString() + "</AssemblyName>");
            builder.AppendLine(this.Tab(2) + "</PropertyGroup>");
            builder.AppendLine(this.Tab(2) + "<PropertyGroup Condition=\" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' \">");
            builder.AppendLine(this.Tab(3) + "<DebugSymbols>true</DebugSymbols>");
            builder.AppendLine(this.Tab(3) + "<DebugType>full</DebugType>");
            builder.AppendLine(this.Tab(3) + "<Optimize>false</Optimize>");
            builder.AppendLine(this.Tab(3) + @"<OutputPath>bin\Debug\</OutputPath>");
            builder.AppendLine(this.Tab(3) + "<DefineConstants>DEBUG;TRACE</DefineConstants>");
            builder.AppendLine(this.Tab(3) + "<ErrorReport>prompt</ErrorReport>");
            builder.AppendLine(this.Tab(3) + "<WarningLevel>4</WarningLevel>");
            builder.AppendLine(this.Tab(2) + "</PropertyGroup>");
            builder.AppendLine(this.Tab(2) + "<PropertyGroup Condition=\" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' \">");
            builder.AppendLine(this.Tab(3) + "<DebugType>pdbonly</DebugType>");
            builder.AppendLine(this.Tab(3) + "<Optimize>true</Optimize>");
            builder.AppendLine(this.Tab(3) + @"<OutputPath>bin\Release\</OutputPath>");
            builder.AppendLine(this.Tab(3) + "<DefineConstants>TRACE</DefineConstants>");
            builder.AppendLine(this.Tab(3) + "<ErrorReport>prompt</ErrorReport>");
            builder.AppendLine(this.Tab(3) + "<WarningLevel>4</WarningLevel>");
            builder.AppendLine(this.Tab(2) + "</PropertyGroup>");
            builder.AppendLine(this.Tab(2) + "<ItemGroup>");
            builder.AppendLine(this.Tab(3) + "<Reference Include=\"System\" />");
            if (this.directoryType == TipoProjeto.DataBase)
            {
                builder.AppendLine(this.Tab(3) + "<Reference Include=\"System.configuration\" />");
            }
            builder.AppendLine(this.Tab(3) + "<Reference Include=\"System.Data\" />");
            builder.AppendLine(this.Tab(3) + "<Reference Include=\"System.Xml\" />");
            builder.AppendLine(this.Tab(2) + "</ItemGroup>");
            builder.AppendLine(this.Tab(2) + "<ItemGroup>");
            foreach (SqlTable table in Program.SqlTableList)
            {
                if (!(!table.Ignore && table.Nome.ToLower().StartsWith(Program.tableStartWith)))
                {
                    continue;
                }
                if (this.directoryType == TipoProjeto.DataBase)
                {
                    builder.AppendLine(this.Tab(3) + "<Compile Include=\"" + table.ClassDataBaseNome + ".cs\" />");
                    continue;
                }
                if (this.directoryType == TipoProjeto.Business)
                {
                    builder.AppendLine(this.Tab(3) + "<Compile Include=\"" + table.ClassBusinessNome + ".cs\" />");
                }
            }
            builder.AppendLine(this.Tab(3) + "<Compile Include=\"Properties\\AssemblyInfo.cs\" />");
            builder.AppendLine(this.Tab(2) + "</ItemGroup>");
            if (this.directoryType == TipoProjeto.Business)
            {
                builder.AppendLine(this.Tab(2) + "<ItemGroup>");
                builder.AppendLine(this.Tab(3) + "<ProjectReference Include=\"..\\" + TipoProjeto.DataBase.ToString() + @"\" + TipoProjeto.DataBase.ToString() + ".csproj\">");
                builder.AppendLine(this.Tab(3) + "<Project>{" + this.stringDataBaseGuide + "}</Project>");
                builder.AppendLine(this.Tab(3) + "<Name>" + TipoProjeto.DataBase.ToString() + "</Name>");
                builder.AppendLine(this.Tab(3) + "</ProjectReference>");
                builder.AppendLine(this.Tab(2) + "</ItemGroup>");
            }
            builder.AppendLine(this.Tab(2) + "<Import Project=\"$(MSBuildBinPath)\\Microsoft.CSharp.targets\" />");
            builder.AppendLine(this.Tab(3) + "<!-- To modify your build process, add your task inside one of the targets below and uncomment it. ");
            builder.AppendLine(this.Tab(3) + "Other similar extension points exist, see Microsoft.Common.targets.");
            builder.AppendLine(this.Tab(3) + "<Target Name=\"BeforeBuild\">");
            builder.AppendLine(this.Tab(3) + "</Target>");
            builder.AppendLine(this.Tab(3) + "<Target Name=\"AfterBuild\">");
            builder.AppendLine(this.Tab(3) + "</Target>");
            builder.AppendLine(this.Tab(2) + "-->");
            builder.AppendLine(this.Tab(1) + "</Project>");
            return builder.ToString();
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

