using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoCRUD.Entidades
{
    public class E_Productos
    {
        public int cod_prod { get; set; }
        public string descrip_prod { get; set; }
        public string marca_prod { get; set; }
        public int codigo_me { get; set; }
        public int cod_cat { get; set; }
        public decimal stock_actual { get; set; }
    }
}
