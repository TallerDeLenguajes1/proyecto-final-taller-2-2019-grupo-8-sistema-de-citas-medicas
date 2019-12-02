﻿using MySql.Data.MySqlClient;
using System.Data;

namespace CapaDatos
{
    public class CD_Conexion
    {
        private MySqlConnection Conexion = new MySqlConnection("Server=localhost; DataBase=libromedico; User=root; Password=a1s2d3f4?");
        public MySqlConnection AbrirConexion()
        {
            if (Conexion.State == ConnectionState.Closed)
                Conexion.Open();
            return Conexion;
        }
        public MySqlConnection CerrarConexion()
        {
            if (Conexion.State == ConnectionState.Open)
                Conexion.Close();
            return Conexion;
        }
    }
}
