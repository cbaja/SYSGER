<%@ Page Title="SYSGER - Recruter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recrutements.aspx.cs" Inherits="SYSGER.Pages.Recrutements" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 22px;
        }
        .style2
        {
        }
        .style3
        {
            width: 242px;
        }
        .style4
        {
            width: 254px;
            
        }
        .style5
        {
            height: 4px;
        }
        .style6
        {
            height: 4px;
            width: 167px;
        }
        .style7
        {
            width: 167px;
        }
        .style18
        {
            width: 16px;
        }
        .style19
        {
            width: 93px;
        }
        .style20
        {
            width: 133px;
        }
        .style21
        {
            width: 262px;
        }
        .style24
        {
            width: 183px;
        }
        .style25
        {
            height: 4px;
            width: 183px;
        }
        .style26
        {
            height: 4px;
            width: 299px;
        }
        .style27
        {
            width: 299px;
        }
        .style28
        {
            width: 167px;
            height: 64px;
        }
        .style29
        {
            width: 299px;
            height: 64px;
        }
        .style30
        {
            width: 183px;
            height: 64px;
        }
        .style31
        {
            height: 64px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="errorLabel" runat="server" Font-Bold="true" ForeColor="Red" Text=""></asp:Label>
    </p>
    <asp:UpdatePanel ID="MainUpdatePanel" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <asp:UpdatePanel ID="ViewUpdatePanel" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <div>
                        <table>
                            <tr>
                                <td class="style1" >
                                    2101522133<br />
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonAddPostulant" runat="server" 
                             ImageUrl="~/Images/addUser.png" AlternateText="Nouveau Postulant" 
                             onclick="ImageButtonAddPostulant_Click" ToolTip="Nouveau Postulant" 
                             />
                                </td>
                                <td class="style1">
                                </td>
                                <td>
                                    <asp:ImageButton ID="ImageButtonRefresh" runat="server" 
                             ImageUrl="~/Images/refreshAll.png" ToolTip="Rafraichir" 
                             onclick="ImageButtonRefresh_Click" />
                                </td>
                            </tr>
                        </table>
                        <br />
                    </div>
                    <asp:UpdatePanel ID="SearchUpdatePanel" UpdateMode="Conditional" runat="server" Visible ="true">
                        <ContentTemplate>
                            <fieldset>
                                <legend>Rechercher postulant(s)</legend>
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="style2">
                                            <asp:ImageButton ID="ImageButtonSearch" runat="server" 
                                        ImageUrl="~/Images/search.png" onclick="ImageButtonSearch_Click" />
                                        </td>
                                        <td class="style3">
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                            <asp:Label ID="NomLabel" runat="server" Text="Nom"></asp:Label>
                                        </td>
                                        <td class="style3">
                                            <asp:TextBox ID="NomSearchTextBox" AutoPostBack="true" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="PrenomLabel" runat="server" Text="Prénom"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="PrenomSearchTextBox" AutoPostBack="true" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style2">
                                    Numéro de référence
                                        </td>
                                        <td class="style3">
                                            <asp:TextBox ID="refIDSearchTextBox" AutoPostBack="true" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                    &nbsp;</td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="ListePostulantUpdatePanel" UpdateMode="Conditional" runat="server" Visible="false"  >
                        <ContentTemplate>
                            <fieldset>
                                <legend>Liste des Postulants</legend>
                                <asp:GridView ID="GridViewRecrutements" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" DataKeyNames="recrutementID" 
                            DataSourceID="EntityDataSourceRecrutements" EmptyDataText="Aucune donnee">
                                    <Columns>
                                        <asp:TemplateField>
                                         <ItemTemplate>
                                        <asp:LinkButton ID="SelectLinkButton" runat="server" CommandArgument='<%# Eval("refID") %>'
                                            OnClick="SelectLinkButton_Click">Consulter</asp:LinkButton>
                                    </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No. Ref" SortExpression="refID">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("refID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("refID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nom" SortExpression="nom">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nom") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nom") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Prénom" SortExpression="prenom">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("prenom") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("prenom") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date Naissance" SortExpression="dateNaissance">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("dateNaissance","{0:MM/dd/yyyy}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server"  Text='<%# Bind("dateNaissance","{0:MM/dd/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Téléphones" SortExpression="phone1">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("phone1") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("phone1") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Niveau Education" 
                                    SortExpression="niveauEducationID">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" 
                                            Text='<%# Bind("niveauEducationID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                               
                                                <asp:DropDownList ID="DropDownListItemNiveauEducation" runat="server" 
                                                    DataSourceID="EntityDataSourceNiveauEducationRef" 
                                                    DataTextField="niveauEducation_Desc" DataValueField="niveauEducationID" 
                                                    AppendDataBoundItems="True" 
                                                    SelectedValue='<%# Bind("niveauEducationID") %>'  >
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Années Expérience" 
                                    SortExpression="anneesExperience">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox8" runat="server" 
                                            Text='<%# Bind("anneesExperience") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("anneesExperience") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Position" SortExpression="positionID">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("positionID") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:DropDownList ID="DropDownListItemPosition" runat="server" 
                                                    DataSourceID="EntityDataSourcePositionRef" DataTextField="positions_Desc" 
                                                    DataValueField="positionID" SelectedValue='<%# Bind("positionID") %>'>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:Label ID="LabelMsg" runat="server" Text="" Visible="false"></asp:Label>
                            </fieldset>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="AddUpdatePanel" UpdateMode="Conditional" runat="server" Visible="false">
                <ContentTemplate>
                    <fieldset>
                        <legend>Nouveau Postulant</legend>
                        <table style="width: 100%;">
                            <tr>
                                <td class="style4" colspan="2" >
                                    <h4>
                                        <asp:Image ID="ImageOK" runat="server" ImageUrl="~/Images/ok.png"  />
                                        &nbsp; <strong>Informations Personnelles</strong></h4>
                                </td>
                                <td class="style24">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Numéro de référence
                                </td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBoxRefID" runat="server" Width="130px" 
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    Statut</td>
                                <td>
                                    <asp:TextBox ID="TextBoxStatut" runat="server" 
                                        ReadOnly="True" Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    <asp:Label ID="Label10" runat="server" Text="Nom"></asp:Label>
                                </td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBoxNom" runat="server" Width="230px"></asp:TextBox>
                                
                                </td>
                                <td class="style24">
                                    <asp:Label ID="Label11" runat="server" Text="Prénom"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPrenom" runat="server" 
                                        Width="230px"></asp:TextBox>
                                 

                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Sexe</td>
                                <td class="style27">
                                    <asp:DropDownList ID="DropDownListSexe" runat="server">
                                        <asp:ListItem Value="M">Masculin</asp:ListItem>
                                        <asp:ListItem Value="F">Feminin</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style24">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Date naissance</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBoxDateNaissance" placeholder="MM/DD/YYYY"  runat="server" 
                                        Width="130px"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtenderDateNaissance" runat="server" TargetControlID="TextBoxDateNaissance">
                                        </asp:CalendarExtender>
                                </td>
                                <td class="style24">
                                    Age</td>
                                <td>
                                    <asp:TextBox ID="TextBoxAge" runat="server" Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Téléphone</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBoxPhone1"  runat="server" 
                                        Width="130px"></asp:TextBox>
                                                                         &nbsp;/
                                    <asp:TextBox ID="TextBoxPhone2" runat="server" 
                                        Width="130px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    email</td>
                                <td>
                                    <asp:TextBox ID="TextBoxEmail" runat="server" Width="130px" 
                                        TextMode="Email"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style28">
                                    Adresse</td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBoxAdresse" runat="server" 
                                        Width="230px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="style30">
                                    &nbsp;</td>
                                <td class="style31">
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" colspan="2" >
                                    <h4>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/ok.png"  />
                                        &nbsp; niveau d&#39;education et competences</h4>
                                </td>
                                <td class="style24">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Domaine</td>
                                <td class="style27">
                                    <asp:DropDownList ID="DropDownListDomaine" runat="server" 
                                        DataSourceID="EntityDataSourceDomaineRef" DataTextField="domaine_Desc" 
                                        DataValueField="domaineID">
                                    </asp:DropDownList>
                                </td>
                                <td class="style24">
                                    Position</td>
                                <td>
                                    <asp:DropDownList ID="DropDownListPosition" runat="server" 
                                        DataSourceID="EntityDataSourcePositionRef" DataTextField="positions_Desc" 
                                        DataValueField="positionID">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Niveau d&#39;éducation</td>
                                <td class="style27">
                                    <asp:DropDownList ID="DropdownListNiveauEducation" runat="server" 
                                        DataSourceID="EntityDataSourceNiveauEducationRef" 
                                        DataTextField="niveauEducation_Desc" DataValueField="niveauEducationID">
                                    </asp:DropDownList>
                                </td>
                                <td class="style24">
                                    Nbre d&#39;années d&#39;expériences</td>
                                <td>
                                    <asp:TextBox ID="TextBoxAnneeExperience"  runat="server" 
                                        Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Niveau informatique</td>
                                <td class="style27">
                                    <asp:DropDownList ID="DropDownListNiveauInformatique" runat="server" 
                                        DataSourceID="EntityDataSourceNiveauRef" DataTextField="niveau_Desc" 
                                        DataValueField="niveauID" Height="16px" Width="72px">
                                    </asp:DropDownList>
                                </td>
                                <td class="style24">
                                    Niveau anglais</td>
                                <td>
                                    <asp:DropDownList ID="DropDownListNiveauAnglais" runat="server" 
                                        DataSourceID="EntityDataSourceNiveauRef" DataTextField="niveau_Desc" 
                                        DataValueField="niveauID">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style28">
                                    Autres compétences</td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBoxautresCompetences"  runat="server" 
                                        Width="230px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="style30">
                                    &nbsp;</td>
                                <td class="style31">
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Référer par</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBoxrefererPar"  runat="server" 
                                        Width="230px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style21">
                                    </td>
                                    <td class="style19">
                                        <asp:Button ID="ButtonAddPostulant" runat="server" style="margin-left: 5px" 
                                            Text="Sauvegarder" ToolTip="Sauvegarder postulant." Width="130px" 
                                            onclick="ButtonAddPostulant_Click" />
                                    </td>
                                    <td class="style18">
                                    </td>
                                    <td class="style20">
                                        <asp:Button ID="ButtonAnnulerPostulant" runat="server" Text="Annuler" 
                                            Width="130px" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdUpdatePanel" UpdateMode="Conditional" runat="server" Visible="false">
                <ContentTemplate>
                    <fieldset>
                        <legend>Modifier Postulant</legend>
                        <table style="width: 100%;">
                            <tr>
                                <td class="style4" colspan="2" >
                                    <h4>
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/ok.png"  />
                                        &nbsp; <strong>Informations Personnelles</strong></h4>
                                </td>
                                <td class="style24">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Numéro de référence
                                </td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBox10" AutoPostBack="true" runat="server" Width="130px" 
                                        ReadOnly="True"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    Statut</td>
                                <td>
                                    <asp:TextBox ID="TextBox11" runat="server" AutoPostBack="true" 
                                        ReadOnly="True" Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    <asp:Label ID="Label12" runat="server" Text="Nom"></asp:Label>
                                </td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBox12" AutoPostBack="true" runat="server" Width="230px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    <asp:Label ID="Label13" runat="server" Text="Prénom"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox13" AutoPostBack="true" runat="server" 
                                        Width="230px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Date naissance</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBox14" AutoPostBack="true" runat="server" 
                                        Width="130px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    Age</td>
                                <td>
                                    <asp:TextBox ID="TextBox15" AutoPostBack="true" runat="server" Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Téléphone</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBox16" AutoPostBack="true" runat="server" 
                                        Width="130px"></asp:TextBox>
                                    &nbsp;/
                                    <asp:TextBox ID="TextBox17" runat="server" AutoPostBack="true" 
                                        Width="130px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    email</td>
                                <td>
                                    <asp:TextBox ID="TextBox18" AutoPostBack="true" runat="server" Width="130px" 
                                        TextMode="Email"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style4" colspan="2" >
                                    <h4>
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/ok.png"  />
                                        &nbsp; niveau d&#39;education et competences</h4>
                                </td>
                                <td class="style24">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Domaine</td>
                                <td class="style27">
                                    <asp:DropDownList ID="DropDownListDomaineId" runat="server" 
                                        DataSourceID="EntityDataSourceDomaineRef" DataTextField="domaine_Desc" 
                                        DataValueField="domaineID">
                                    </asp:DropDownList>
                                </td>
                                <td class="style24">
                                    Position</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="EntityDataSourcePositionRef" DataTextField="positions_Desc" 
                                        DataValueField="positionID">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Niveau d&#39;éducation</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBox21" AutoPostBack="true" runat="server" 
                                        Width="130px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    Nbre d&#39;années d&#39;expériences</td>
                                <td>
                                    <asp:TextBox ID="TextBox22" AutoPostBack="true" runat="server" 
                                        Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Niveau informatique</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBox23" AutoPostBack="true" runat="server" 
                                        Width="130px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    Niveau anglais</td>
                                <td>
                                    <asp:TextBox ID="TextBox24" AutoPostBack="true" runat="server" 
                                        Width="130px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style28">
                                    Autres compétences</td>
                                <td class="style29">
                                    <asp:TextBox ID="TextBox25" AutoPostBack="true" runat="server" 
                                        Width="230px" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td class="style30">
                                    &nbsp;</td>
                                <td class="style31">
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    Référer par</td>
                                <td class="style27">
                                    <asp:TextBox ID="TextBox26" AutoPostBack="true" runat="server" 
                                        Width="230px"></asp:TextBox>
                                </td>
                                <td class="style24">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <tr>
                                <td class="style6 >
                                    
                                </td ">
                                    <td class="style26" >
                                    </td>
                                    <td class="style25">
                                    </td>
                                    <td class="style5">
                                    </td>
                            </tr>
                            <table style="width: 100%;">
                                <tr>
                                    <td class="style21">
                                    </td>
                                    <td class="style19">
                                        <asp:Button ID="Button1" runat="server" style="margin-left: 5px" 
                                            Text="Sauvegarder" ToolTip="Sauvegarder postulant." Width="130px" />
                                    </td>
                                    <td class="style18">
                                    </td>
                                    <td class="style20">
                                        <asp:Button ID="Button2" runat="server" Text="Annuler" 
                                            Width="130px" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </table>
                    </fieldset>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="EntitiesUpdatePanel" UpdateMode="Conditional" runat="server"
                Visible="false">
                <ContentTemplate>
                    <asp:EntityDataSource ID="EntityDataSourceRecrutements" runat="server" 
                        ConnectionString="name=SYSGEREntities" DefaultContainerName="SYSGEREntities" 
                        EnableFlattening="False" EntitySetName="recrutements" 
                        EntityTypeFilter="recrutement" OrderBy="it.CREATION_Date desc">
                    </asp:EntityDataSource>
                    <asp:QueryExtender ID="QueryExtenderRecrutement" runat="server" TargetControlID="EntityDataSourceRecrutements">
                        <asp:SearchExpression SearchType="Contains" DataFields="Nom">
                            <asp:ControlParameter ControlID="NomSearchTextBox" />
                        </asp:SearchExpression>
                        <asp:SearchExpression SearchType="Contains" DataFields="Prenom">
                            <asp:ControlParameter ControlID="PrenomSearchTextBox" />
                        </asp:SearchExpression>
                        <asp:SearchExpression SearchType="Contains" DataFields="RefId">
                            <asp:ControlParameter ControlID="refIDSearchTextBox" />
                        </asp:SearchExpression>
                    </asp:QueryExtender>
                    <asp:EntityDataSource ID="EntityDataSourceDomaineRef" runat="server" 
                        ConnectionString="name=SYSGEREntities" DefaultContainerName="SYSGEREntities" 
                        EnableFlattening="False" EntitySetName="domaine_ref" 
                        EntityTypeFilter="domaine_ref" Select="it.[domaineID], it.[domaine_Desc]">
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourcePositionRef" runat="server" 
                        ConnectionString="name=SYSGEREntities" DefaultContainerName="SYSGEREntities" 
                        EnableFlattening="False" EntitySetName="position_ref" 
                        Select="it.[positionID], it.[positions_Desc]">
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourceNiveauEducationRef" runat="server" 
                        ConnectionString="name=SYSGEREntities" DefaultContainerName="SYSGEREntities" 
                        EnableFlattening="False" EntitySetName="niveau_education_ref" 
                        Select="it.[niveauEducationID], it.[niveauEducation_Desc]">
                    </asp:EntityDataSource>
                    <asp:EntityDataSource ID="EntityDataSourceNiveauRef" runat="server" 
                        ConnectionString="name=SYSGEREntities" DefaultContainerName="SYSGEREntities" 
                        EnableFlattening="False" EntitySetName="niveau_ref" 
                        Select="it.[niveauID], it.[niveau_Desc]" EntityTypeFilter="niveau_ref">
                    </asp:EntityDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
