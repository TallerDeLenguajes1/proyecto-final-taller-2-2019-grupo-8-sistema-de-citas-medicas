using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Entidades.Helps
{
    //UTILIZO ESTA CLASE PARA PODER HACER LA VALIDACION DE DATOS
    //LA CUAL EVALUARA CADA RESTRICCION QUE SE PUSO EN LA CLASE USUARIO
    //(A FUTURO SE DEBEN INGRESAR EN TODAS LAS CLASES ESTA EVALUACION)

    public class ValidacionDatos
    {
        private ValidationContext Contexto;
        private List<ValidationResult> Resultado;
        private bool Valido;
        private string Mensaje;

        public ValidacionDatos(object Instancia) {
            Contexto = new ValidationContext(Instancia);
            Resultado = new List<ValidationResult>();
            Valido = Validator.TryValidateObject(Instancia, Contexto, Resultado, true);
        }

        public bool Validar() {
            if (Valido==false)
            {
                foreach (ValidationResult item in Resultado) {
                    Mensaje += item.ErrorMessage + "\n";
                }
                MessageBox.Show(Mensaje);
            }
            return Valido;
        }
    }
}
