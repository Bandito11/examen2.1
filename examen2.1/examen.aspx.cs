using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace examen2._1
{
    public partial class examen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                string FechaActual = DateTime.Today.ToString("MM/dd/yyyy");
                this.lblFechaCompra.Text = FechaActual;

                //Añadir label que se llame lblFechaCompra
            }
        }


        protected void ddNPlazos_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //double.Parse (convierte la representación en forma de cadena (string) de un número
            //en el número de punto flotante de precisión doble equivalente)

            //****Añadir TEXTBOX llamado Precio PrecioVenta a la FORM****
            double PrecioVenta = double.Parse(this.PrecioVenta.Text.ToString());
            //****añadir TEXTBOX llamado DescFab a la FORM****
            double DescFab = double.Parse(this.DescFab.Text.ToString());
            //****anadir TEXTBOX llamado DescDealer a la FORM****
            double DescDealer = double.Parse(this.DescDealer.Text.ToString());

            ////Total Descuentos////
            double TotalDescuentos = ((PrecioVenta) - (DescFab) - (DescDealer));
            //Format inserta un valor (currency) en una cadena (string)
            string formatoTotalDescuentos = String.Format("{0:C}", TotalDescuentos);
            //****Crear un label que se llame TottalDescuentos****
            this.lblTotalDescuentos.Text = formatoTotalDescuentos;
            //****Crear textbox llamado Pronto
            double Pronto = double.Parse(this.Pronto.Text.ToString());

            //Balance Adeudado//////
            double TotalBalAdeudado = ((TotalDescuentos) - (Pronto));
            string formatoBalAdeudado = String.Format("{0:C}", TotalBalAdeudado);
            //****Crear label llamado lblBalanceAdeudado****
            this.lblBalanceAdeudado.Text = formatoBalAdeudado;


            ////Total Seguros////
            //****Crear textbox llamado Seguro****
            double Seguro = double.Parse(this.Seguro.Text.ToString());
            //****Crear Textbox llamado gExtendida****
            double gExt = double.Parse(this.gExtendida.Text.ToString());
            double TotalSeguros = ((Seguro) + (gExt));
            string formatoToSeguros = String.Format("{0:C}", TotalSeguros);
            //****Crear label llamados lblTotalSeguros
            this.lblTotalSeguros.Text = formatoToSeguros;

            ////Total Derechos/////
            //****Crear textbox llamado derecho1****
            double derecho1 = double.Parse(this.Derecho1.Text.ToString());
            //****Crear textbox llamado derecho2****
            double derecho2 = double.Parse(this.Derecho2.Text.ToString());
            double TotalDerechos = ((derecho1) + (derecho2));
            string formatoToTotalDerechos = String.Format("{0:C}", TotalDerechos);
            //****Crear label llamados lblTotalDerechos
            this.lblTotalDerechos.Text = formatoToTotalDerechos;

            ////Pago Mensual////
            double BalFinanciar = ((TotalBalAdeudado) + (TotalSeguros));
            string formatoBalFinanciar = String.Format("{0:C}", BalFinanciar);
            //****Crear label llamado lblBalanceFinanciar****
            this.lblBalanceFinanciar.Text = formatoBalFinanciar;
            double balanceFinanciar = BalFinanciar;
            //*****crear textbox llamado Interes****
            double interes = double.Parse(this.Interes1.Text.ToString());
            //****crear DROPDOWNLIST llamado ddNPlazos****
            int numeroPlazos = int.Parse(this.ddNPlazos.Text.ToString());
            //Math.Poe (Devuelve un numero especificado elevado a la poterncia especificada)
            double PagoMensual = (Math.Pow(1 + interes, numeroPlazos - 1) * balanceFinanciar);
            double rate = interes / 100 / 12;
            double denominator = Math.Pow((1 + rate), numeroPlazos) - 1;
            //Math.Roun (Redonde un valor al enter mas proximo o al numero especificado de 
            //digitos fraccionarios.
            PagoMensual = Math.Round(((rate / denominator) * balanceFinanciar), 0);
            string formatoPagoMensual = String.Format("{0:C}", PagoMensual);
            //*****crear label llamado lblPagoMensual*****
            this.lblPagoMensual.Text = formatoPagoMensual;
            this.modalPop.Text = formatoPagoMensual;
            double PrimerPago = (PagoMensual + TotalDerechos);
            string formatoPrimerPago = String.Format("{0:C}", PrimerPago);

            //****Crear labell llamado lblNumPagos****
            this.lblNumPago.Text = (numeroPlazos - 1).ToString() + " Pagos de: ";

            //****crear label llamado lblPagoMen
            this.lblPagoMen.Text = formatoPagoMensual;

            this.LinkButton1_ModalPopupExtender.Show();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            this.PrecioVenta.Text = "50342";
            this.Model.Text = "Ford Mustang 2015";
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            this.PrecioVenta.Text = "145436";
            this.Model.Text = "Dodge Charge 2015";
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            this.PrecioVenta.Text = "12747";
            this.Model.Text = "Chevrolet Corvette 2015";
        }
    }
}