using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades.Cache
{
    //ESTA CLASE CACHE SIRVE PARA ALMACENAR LOS DATOS DEL USUARIO QUE SE HA LOGUEADO
    //DE MANERA QUE CUANDO EL USUARIO ENTRA SE GUARDAN LOS DATOS NECESARIOS O QUE PODAMOS
    //NECESITAR PARA POR EJEMPLO MOSTRAR EL NOMBRE DE USUARIO QUE SE HA LOGUEADO
    //O QUE USUARIO HACE LAS TRANSACCIONES EN EL SISTEMA DE MANERA QUE SE PUEDA TENER ESE;
    //REGISTRO ANTE EVENTUALES PROBLEMAS QUE PUEDEN SURGIR

    public static class UsuarioLoginCache
    {
        public static int ID_Usuario { get; set; }
        public static string NombreUsuario { get; set; }
        public static string Nombre { get; set; }
        public static string Apellido { get; set; }
        public static string Contraseña { get; set; }
        public static string Email { get; set; }
        public static bool EsAdministrador { get; set; }
        public static bool EsActivo { get; set; }
    }
}
