<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebApplication1.Presentation.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .info, .header {
            min-width: 450px;
        }

            .header span {
                font-weight: bold;
                border: 1px solid;
            }

        span {
            min-width: 150px;
            background-color: #9fedd5;
            display: inline-block;
            border: 1px solid #9fedd5;
            margin: 0px;
            padding: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater runat="server" ID="rptProduct">
                <HeaderTemplate>
                    <h1>Repeater</h1>
                    <div class="header">
                        <span>Product Id</span>
                        <span>Product Name</span>
                        <span>Price</span>
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="info">
                        <span><%#Eval("Id") %></span>
                        <span><%#Eval("Name") %></span>
                        <span><%#Eval("Price") %></span>
                    </div>
                </ItemTemplate>
                <SeparatorTemplate>
                </SeparatorTemplate>
                <FooterTemplate>
                    <h3>End Repeater</h3>
                </FooterTemplate>
            </asp:Repeater>
            <hr />
            <div>
                <h1>Ajax call web service</h1>
                <ul id="products">
                </ul>
            </div>
            <hr />
            <table>
                <tr>
                    <td>Product Id</td>
                    <td>
                        <asp:TextBox ID="txtId" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <button id="submitAjax">Submit Ajax</button></td>
                    <td>
                        <asp:Button ID="submitASPNET" runat="server" OnClick="AddProduct" Text="Submit ASP Net" /></td>
                </tr>
            </table>

            <script src="../Scripts/jquery-2.2.2.js"></script>
            <script>
                $(function () {

                    function LoadData() {
                        $('#products').html('');
                        $.ajax({
                            url: '../Service/ProductService.asmx/GetAllProduct',
                            contentType: 'application/json',
                            type: 'POST',
                            success: function (data) {
                                console.log(data.d.length)
                                if (data.d !== undefined && data.d.length > 0) {
                                    $.each(data.d, function (index, product) {
                                        console.log(product);
                                        var str = '<li>' + product.Id + '. ' + product.Name + ' ($' + product.Price + ')</li>';
                                        $('#products').append(str);
                                    });
                                }
                            },
                            error: function () {

                            },
                            complete: function () {

                            },
                            then: function () {

                            },
                            done: function () {

                            }
                        });
                    }

                    $('#submitAjax').click(function (event) {
                        event.preventDefault();
                        var product = {
                            Id: $('#txtId').val(),
                            Name: $('#txtName').val(),
                            Price: $('#txtPrice').val()
                        };


                        $.ajax({
                            url: '../Service/ProductService.asmx/AddProduct',
                            dataType: 'json',
                            data: JSON.stringify({ prod: product }),
                            contentType: 'application/json',
                            type: 'POST',
                            success: function (data) {
                                if (data!==undefined && data.d) {
                                    LoadData();
                                } else {
                                    alert('fail');
                                }
                            }
                        });
                    });

                    $(document).ready(function () {
                        LoadData();
                    });
                });
            </script>
        </div>
    </form>
</body>
</html>
