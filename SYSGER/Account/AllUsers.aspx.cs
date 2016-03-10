using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
//using GestionCompteur.Tools;
namespace GestionCompteur.Account
{
    public partial class AllUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                NewPasswordLabel.Text = string.Empty;
                errorLabel.Text = string.Empty;
                UserRolesCheckBoxList.Visible = false;
                saveLinkButton.Visible = false;
                usernameLabel.Visible = false;
                RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);


            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }

        protected void LoadUserRole(string username)
        {
            try
            {
                for (int i = 0; i < UserRolesCheckBoxList.Items.Count; i++)
                {

                    if (Roles.IsUserInRole(username, UserRolesCheckBoxList.Items[i].Text))
                    {
                        UserRolesCheckBoxList.Items[i].Selected = true;
                    }
                }
            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }


        protected void ResetPassLinkButton_Click(object sender, EventArgs e)
        {
            string s = ((LinkButton)sender).CommandArgument;
            MembershipUser u = Membership.GetUser(s, false);
            NewPasswordLabel.Text = "Le Nouveau Password de << " + u.UserName + " >> est : " + Server.HtmlEncode(u.ResetPassword());
        }

        protected void DroitAccesLinkButton_Click(object sender, EventArgs e)
        {
            try
            {
                string un = ((LinkButton)sender).CommandArgument;
                UserRolesCheckBoxList.Visible = true;
                UserRolesCheckBoxList.DataBind();
                saveLinkButton.Visible = true;
                usernameLabel.Visible = true;
                usernameLabel.Text = un;
                LoadUserRole(usernameLabel.Text);
            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }

        protected void saveLinkButton_Click(object sender, EventArgs e)
        {
            try{

            for (int i = 0; i < UserRolesCheckBoxList.Items.Count; i++)
            {

                if (UserRolesCheckBoxList.Items[i].Selected)
                {
                    if (!Roles.IsUserInRole(usernameLabel.Text, UserRolesCheckBoxList.Items[i].Text))
                    {
                        //Add Role to user
                        Roles.AddUserToRole(usernameLabel.Text, UserRolesCheckBoxList.Items[i].Text);
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(usernameLabel.Text, UserRolesCheckBoxList.Items[i].Text))
                    {
                        //remove Role to user
                        Roles.RemoveUserFromRole(usernameLabel.Text, UserRolesCheckBoxList.Items[i].Text);
                    }
                }
            }
            LoadUserRole(usernameLabel.Text);
            NewPasswordLabel.Text = "Les Droits d' Acces de : << " + usernameLabel.Text + " >> ont été Modifié avec Succès !!!";
            }
            catch(Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }
        
    }
}