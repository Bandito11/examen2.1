<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="examen.aspx.cs" Inherits="examen2._1.examen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p style="color:firebrick; font-size:large">Pago Mensual Prestamo de Auto</p>
    <div class="row">
                <div class="col-md-4">
                    <asp:ImageButton ID="ImageButton1" CssClass="img-responsive" runat="server" ImageUrl="image/mustang.jpg" OnClick="ImageButton1_Click" />

                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="ImageButton2" CssClass="img-responsive" runat="server" ImageUrl="image/charger.jpg" OnClick="ImageButton2_Click" />
                </div>
                <div class="col-md-4">
                    <asp:ImageButton ID="ImageButton3" CssClass="img-responsive" runat="server" ImageUrl="image/corvette.jpg" OnClick="ImageButton3_Click" />
                </div>
            </div>
        <!--La Forma-->
    <div class="row">
        <asp:Label ID="Model" runat="server" Text=""></asp:Label><br />
            <div class="col-md-7">
                
            <asp:TextBox ID="PrecioVenta" runat="server"></asp:TextBox><asp:Label ID="Label1" runat="server" Text="Precio de Venta"></asp:Label>
                <br />
            <br />
            <asp:TextBox ID="DescFab" runat="server"></asp:TextBox><asp:Label ID="Label2" runat="server" Text="Descuento Fabricante"></asp:Label>
                <br />
            <br />
            <asp:TextBox ID="DescDealer" runat="server"></asp:TextBox><asp:Label ID="Label3" runat="server" Text="Descuento Dealer"></asp:Label>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Total menos Descuentos:"></asp:Label><asp:Label ID="lblTotalDescuentos" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="Pronto" runat="server"></asp:TextBox><asp:Label ID="Label6" runat="server" Text="Pronto/TradeIn"></asp:Label>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Balance Adeudado:"></asp:Label><asp:Label ID="lblBalanceAdeudado" runat="server" Text="" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="Seguro" runat="server"></asp:TextBox><asp:Label ID="Label9" runat="server" Text="Seguro"></asp:Label>
                <br />
            <br />
            <asp:TextBox ID="gExtendida" runat="server"></asp:TextBox><asp:Label ID="Label10" runat="server" Text="Garantia Extendida"></asp:Label>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Total seguros:"></asp:Label><asp:Label ID="lblTotalSeguros" runat="server" Text="" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="Derecho1" runat="server"></asp:TextBox><asp:Label ID="Label13" runat="server" Text="Derechos"></asp:Label>
                <br />
            <br />
            <asp:TextBox ID="Derecho2" runat="server"></asp:TextBox><asp:Label ID="Label14" runat="server" Text="Registro"></asp:Label>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Total Derechos:"></asp:Label><asp:Label ID="lblTotalDerechos" runat="server" Text=""></asp:Label>
            <br />
            <asp:Label ID="Label17" runat="server" Text="Interes:"></asp:Label><asp:Label ID="Interes" runat="server"></asp:Label>
                <asp:TextBox ID="Interes1" runat="server"></asp:TextBox>
                <ajaxToolkit:SliderExtender runat="server" Minimum="0" Maximum="100" Decimals="2" BehaviorID="Interes1_SliderExtender" TargetControlID="Interes1" ID="Interes1_SliderExtender" BoundControlID="Interes"></ajaxToolkit:SliderExtender>
                <br />
            <asp:Label ID="Label19" runat="server" Text="Plazos:"></asp:Label>
            <asp:DropDownList ID="ddNPlazos" runat="server">
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>24</asp:ListItem>
                <asp:ListItem>36</asp:ListItem>
                <asp:ListItem>48</asp:ListItem>
                <asp:ListItem>60</asp:ListItem>
                <asp:ListItem>72</asp:ListItem>
                <asp:ListItem>84</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Calcular" OnClick="Button1_Click" />
                </div>
            <div class="col-md-5">
                <div style="border:dotted 5px green";>
                <asp:Label ID="Label5" runat="server" Text="Fecha de Compra:"></asp:Label><asp:Label ID="lblFechaCompra" ForeColor="Red" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label12" runat="server" Text="Balance a Financiar:"></asp:Label><asp:Label ID="lblBalanceFinanciar" runat="server"></asp:Label>
                
                    <asp:Label ID="Label8" runat="server" Text="Primer Pago: "></asp:Label><asp:Label ID="lblPagoMensual" runat="server" Text=""></asp:Label>
                    <br />
                    <asp:Label ID="lblNumPago" runat="server" Text=""></asp:Label><asp:Label ID="lblPagoMen" ForeColor="Red" runat="server"></asp:Label>
                </div>
                <asp:Label ID="Label16" runat="server" Text="Fecha Primer Pago: "></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1" />
            </div>
        </div>
    <asp:Panel ID="PanelForModal" runat="server">
        <div class="jumbotron">
         <p style="color:green">Su pago mensual sera de:</p>
        <asp:Label ID="modalPop" runat="server" ForeColor="Red" Text=""></asp:Label>
        <button class="btn btn-danger" id="buttonX">X</button>
        </div>
    </asp:Panel>
    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender 
        runat="server" 
        BehaviorID="LinkButton1_ModalPopupExtender" 
        TargetControlID="LinkButton1" 
        ID="LinkButton1_ModalPopupExtender" 
        PopupControlID="PanelForModal" 
        OnCancelScript="buttonX"></ajaxToolkit:ModalPopupExtender>
</asp:Content>
