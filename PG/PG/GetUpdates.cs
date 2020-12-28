using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PG
{
    class GetUpdates
    {
        private  int counter { get; set; }
        private string dbname { get; set; }
        private string idColumn { get; set; }


            public GetUpdates(string dbname, string idColumn, int number)
            {
                this.dbname = dbname;
                this.idColumn = idColumn;
                this.counter = number;
            }
            
            WriteData _writeData = new WriteData();
            
            private GetRandomRusData _rusData = new GetRandomRusData();
            public void CreateUpdateStatement()
            {
                using (StreamWriter w = File.AppendText("log.txt"))
                {

                    for (var i = 1; i <= counter; i++)
                    {
                        string txt = _rusData.GenRandomString("АБВГДЕЁЖЗИЙЛКМНОПРСТУФХЧШЩЬЯЮабвгдеёжзийлкмнопрстуфхчшщьяю", 200);
                        _writeData.WriteIntoFile($"UPDATE {dbname} = '{txt}' WHERE (`{idColumn}` = {i});", w);
                    }
                }
            }
                
            
        
    }
}
