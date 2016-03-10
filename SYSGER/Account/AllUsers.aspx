<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="AllUsers.aspx.cs" Inherits="GestionCompteur.Account.AllUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<script type="text/javascript">
    dialog = $("#dialogform").dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
           Cancel: function () {
                dialog.dialog("close");
            }
        },
        close: function () {
            form[0].reset();
            //allFields.removeClass("ui-state-error");
        }
    });

</script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div class="progress">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Chargement en cours..."></asp:Label>
                    <br />
                    <asp:Image runat="server" ID="Image1" ImageUrl="~/images/wait.gif"></asp:Image>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title">
                        Liste de tous les utilisateurs
                    </h1>
                </div>
                <div class="panel-body">
                    <div>
                        <p>
                            <asp:Label ID="errorLabel" runat="server" Visible="false" Font-Bold="True" ForeColor="red"></asp:Label>
                            <asp:Label ID="NewPasswordLabel" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>
                        </p>
                    </div>
                    <div id="searchbox" class="searchbox search">
                        <asp:Label ID="Label2" runat="server" Text="Rechercher Par Nom d' Utilisateur : "></asp:Label>
                        <asp:TextBox ID="TBRechercher" placeholder="Nom d'utilisateur" runat="server" AutoPostBack="True"></asp:TextBox>
                        <p>
                        </p>
                        <p>
                            Créer Un Nouveau Utilisateur :
                            <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Cliquer Ici.</asp:HyperLink>
                        </p>
                        <p>
                        </p>
                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                                    AllowPaging="True" AllowSorting="True" EmptyDataText="Aucun utilisateur ne correspond a votre recherche"
                                    DataKeyNames="Username" CellPadding="4" ForeColor="#333333" GridLines="None"
                                    DataSourceID="AllUsersEntityDataSource" PageSize="20" HorizontalAlign="Center"
                                    Width="100%">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nom d'utilisateur">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkusername" runat="server" Text='<%# Eval("Username")%>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Email" HeaderText="Email" />
                                        <asp:BoundField DataField="LastLoginDate" HeaderText="Derniere connexion" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ResetPassLinkButton" runat="server" CommandArgument='<%# Eval("Username") %>'
                                                    OnClick="ResetPassLinkButton_Click">Reset Password</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="DroitAccesLinkButton" runat="server" CommandArgument='<%# Eval("Username") %>'
                                                    OnClick="DroitAccesLinkButton_Click">Droit d&#39;Acces</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                            </td>
                            <td>
                                <p>
                                    <asp:Label ID="usernameLabel" runat="server" Visible="False" Font-Bold="True" ForeColor="#009933"></asp:Label>
                                </p>
                                <asp:CheckBoxList ID="UserRolesCheckBoxList" runat="server" DataSourceID="RoleEntityDataSource"
                                    DataTextField="RoleName" DataValueField="RoleId" Visible="False">
                                </asp:CheckBoxList>
                                <p>
                                    <asp:LinkButton ID="saveLinkButton" runat="server" Visible="false" OnClick="saveLinkButton_Click">Modifier</asp:LinkButton>
                                </p>
                                <asp:EntityDataSource ID="RoleEntityDataSource" runat="server" ConnectionString="name=aspnetdbEntities"
                                    DefaultContainerName="aspnetdbEntities" EnableFlattening="False" EntitySetName="vw_aspnet_Roles"
                                    Select="it.[RoleId], it.[RoleName]">
                                </asp:EntityDataSource>
                            </td>
                        </tr>
                    </table>
                    <asp:EntityDataSource ID="AllUsersEntityDataSource" runat="server" ConnectionString="name=aspnetdbEntities"
                        DefaultContainerName="aspnetdbEntities" EnableFlattening="False" EntitySetName="vw_aspnet_MembershipUsers">
                    </asp:EntityDataSource>
                    <asp:QueryExtender ID="QueryExtender1" runat="server" TargetControlID="AllUsersEntityDataSource">
                        <asp:SearchExpression SearchType="Contains" DataFields="username">
                            <asp:ControlParameter ControlID="TBRechercher" />
                        </asp:SearchExpression>
                    </asp:QueryExtender>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
