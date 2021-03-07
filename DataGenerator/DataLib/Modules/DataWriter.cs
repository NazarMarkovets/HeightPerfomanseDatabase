using System;
using System.IO;

namespace DataLib.Modules
{
    public class DataWriter
    {
        internal string database;
        internal int counter;
        internal string oneline { get; set; }
        public DataWriter()
        {

        }
        public DataWriter(string dbname, int counter)
        {
            database = dbname;
            this.counter = counter;
        }

        internal int insertedRows = 0;


        internal void WriteInsert( string lines)
        {
            using (StreamWriter w = new StreamWriter(@"Dat\GeneratedInserts.txt",true))
            {
                try
                {
                    

                    char c = '"';
                    insertedRows++;
                    var statement = $"INSERT INTO {database} VALUES ({insertedRows},{c}{lines}{c})";
                    WriteIntoFile(statement, w);
                }
                catch
                {
                    throw new ApplicationException();
                }
            }
        }
        internal void WriteIntoFile(string insert, TextWriter w)
        {
            w.WriteLine($"{insert}");
            w.Close();
        }

        internal void WriteFormatedText(string lines)
        {
            using (StreamWriter сWriter = File.AppendText(@"Dat\FormatedText.txt"))
            {
                WriteIntoFile(lines, сWriter);
            }
        }

    }
}