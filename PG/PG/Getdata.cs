using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PG
{
    class Getdata
    {



        internal string[] lines = File.ReadAllLines(@"Dat\data.txt");
        public string line = "";
        public int id = 1;
        public int insertedRows = 0;
        /*
        using (StreamWriter w = File.AppendText(@"Dat\log.txt"))
            {
                foreach (string name in lines)
                {
                    //if (insertedRows == counter) break;
                    //line += " " + name;
                    
                    if (id % 2 == 0)
                    {
                        insertedRows++;
                        string statement = $"INSERT INTO {dbname} VALUES ({insertedRows},{line})";
                        WriteIntoFile(statement, w);

                        line = " ";
                    }
                        id += 1;
                }
            }



    */

    }
}
