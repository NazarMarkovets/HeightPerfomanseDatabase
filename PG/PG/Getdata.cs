using System.IO;

namespace PG
{
    class Getdata
    {
        
        internal string database;
        internal int counter;
        internal string oneline { get; set; }
        public Getdata(string dbname, int counter)
        {
            database = dbname;
            this.counter = counter;
        }
        
        internal int insertedRows = 0;


        internal void WriteInsert( string lines)
        {
            using (StreamWriter w = File.AppendText(@"Dat\GeneratedInserts.txt"))
            {
                
                    char c = '"';
                    insertedRows++;
                    var statement = $"INSERT INTO {database} VALUES ({insertedRows},{c}{lines}{c})";
                    WriteIntoFile(statement, w);
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




