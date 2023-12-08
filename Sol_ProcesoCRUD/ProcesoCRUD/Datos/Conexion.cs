using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoCRUD.Datos
{
    public class Conexion
    {
        private string Base;
        private string Servidor;
        private string Usuario;
        private string Clave;
        private static Conexion con = null;

        private Conexion()
        {
            this.Base = "BD_CRUD_CURSO";
            this.Servidor = "Manulo-PC\\SQLLABO";
            this.Usuario = "ecasulo";
            this.Clave = "12345678";
        }
        /*
         * Creamos la conexion de la base de datos
         */
        public SqlConnection CrearConexion()
        {
            SqlConnection cadena = new SqlConnection();
            try
            {
                cadena.ConnectionString = "server=" + this.Servidor +
                                          "; database=" + this.Base +
                                          "; user=" + this.Usuario +
                                          "; password=" + this.Clave +
                                          ";";
            }
            catch (Exception ex)
            {
                cadena = null;
                throw ex;
            }
            return cadena;
        }

        /* 
         * Para evitar que se cree una nueva conexion a la base de datos
         * Se crea un metodo estatico que devuelva la misma conexion
         * Si la conexion es nula, se crea una nueva 
        */
        public static Conexion getInstancia()
        {
            if (con == null)
            {
                con = new Conexion();
            }
            return con;
        }
    }
}
