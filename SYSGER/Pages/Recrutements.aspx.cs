using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SYSGER.Model;
using SYSGER.Tools;
using System.Transactions;


namespace SYSGER.Pages
{
    public partial class Recrutements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                AddUpdatePanel.Visible = false;
                ListePostulantUpdatePanel.Visible = true;
                UpdUpdatePanel.Visible = false;
                SearchUpdatePanel.Visible = true;
                EntitiesUpdatePanel.Visible = false;
              //  DepartementDropDownList.SelectedValue = "OU";
               // DepartementDropDownList.DataBind();
                //Default Commune
              //  CommuneDropDownList.SelectedValue = "HT.OU.PP-1-HT6110-COM";
             //   CommuneDropDownList.DataBind();

                //LocaliteDropDownList.AppendDataBoundItems = true;
                //ListItem choice1 = new ListItem("", "");
                //LocaliteDropDownList.Items.Insert(0, choice1);
                //LocaliteDropDownList.DataBind();
                if (Session["Operation"] == null)
                {
                  //  Session["Operation"] = new List<Antecedents_Chirurgicaux>();
                    //LocaliteDropDownList.DataBind();
                }
                if (Session["Operation"] == null)
                {
                   // Session["Operation"] = new List<Antecedents_Chirurgicaux>();
                    //LocaliteDropDownList.DataBind();
                }
            }
        }

        DataLayer dal = new DataLayer();

        cl_Tools tool = new cl_Tools();

        protected void ImageButtonAddPostulant_Click(object sender, ImageClickEventArgs e)
        {
            AddUpdatePanel.Visible = true;
            ListePostulantUpdatePanel.Visible = false;
            UpdUpdatePanel.Visible = false;
            SearchUpdatePanel.Visible = false;
            EntitiesUpdatePanel.Visible = false;
            TextBoxRefID.Text = "REF-XXX";
            TextBoxStatut.Text = "POSTULER";
        }

        protected void ImageButtonRefresh_Click(object sender, ImageClickEventArgs e)
        {
            AddUpdatePanel.Visible = false;
            ListePostulantUpdatePanel.Visible = false;
            UpdUpdatePanel.Visible = false;
            SearchUpdatePanel.Visible = true;
            EntitiesUpdatePanel.Visible = false;
            ClearRecForm();
        }

        protected void ImageButtonSearch_Click(object sender, ImageClickEventArgs e)
        {
            if (GridViewRecrutements.Rows.Count < 1)
            {
                LabelMsg.Text = "Aucune Ligne";
                LabelMsg.Visible = true;
            }
            else
            {
                AddUpdatePanel.Visible = false;
                ListePostulantUpdatePanel.Visible = true;
                UpdUpdatePanel.Visible = false;
                SearchUpdatePanel.Visible = true;
                EntitiesUpdatePanel.Visible = false;
            }

        }

        protected void save(string action)
        {

            try
            {
                // Model.Recrutement 
                recrutement r = new recrutement();
                //if (action == "Update")
                //{
                //    r = dal.GetPatientByID(long.Parse(PatientIDHiddenField.Value));

                  
                //}
                
                r.nom = TextBoxNom.Text;
                r.prenom = TextBoxPrenom.Text;
                r.sexe = DropDownListSexe.SelectedValue;
                r.dateNaissance = DateTime.Parse(TextBoxDateNaissance.Text);
                r.age = Convert.ToInt32(TextBoxAge.Text);
                r.phone1 = TextBoxPhone1.Text ;
                r.phone2 = TextBoxPhone2.Text ;
                r.email = TextBoxEmail.Text ;
                r.adresse = TextBoxAdresse.Text ;
                r.domaineID = Convert.ToInt32(DropDownListDomaine.SelectedValue);
                r.positionID = Convert.ToInt32(DropDownListPosition.SelectedValue );
                r.niveauEducationID = Convert.ToString(DropdownListNiveauEducation.SelectedValue);
                r.anneesExperience = Convert.ToInt32(TextBoxAnneeExperience.Text);
                r.niveauInformatiqueID = Convert.ToString(DropDownListNiveauInformatique.SelectedValue);
                r.niveauAnglaisID = Convert.ToString(DropDownListNiveauAnglais.SelectedValue);
                r.autresCompetences = TextBoxautresCompetences.Text;
                r.refererPar = TextBoxrefererPar.Text;
                r.statut = "POSTULER";
                r.update_user = User.Identity.Name;
                r.update_date = DateTime.Now;
                
               
                
                if (action == "Add")
                {
                    using (TransactionScope scope = new TransactionScope())
                    {
                        r.creation_date = DateTime.Now;
                        r.creation_user = User.Identity.Name;
                        dal.AddRecrutement(r);
                        scope.Complete();

                    }
                }
                else
                {
                    dal.UpdateRecrutement(r);

                }

                GridViewRecrutements.DataBind();
                Response.Redirect("Recrutements.aspx");
               
            }
            catch (Exception ex)
            {
                errorLabel.Text = (ex.InnerException != null) ? ex.InnerException.Message : ex.Message;
            }
        }
        protected void ButtonAddPostulant_Click(object sender, EventArgs e)
        {
            save("Add");
        }


        private void ClearRecForm()
        {
            NomSearchTextBox.Text = "";
            PrenomSearchTextBox.Text = "";
            refIDSearchTextBox.Text = "";
           
        }

        protected void SelectLinkButton_Click(object sender, EventArgs e)
        {
          //  LoadPatient(Int64.Parse(((LinkButton)sender).CommandArgument));
            tool.ChangeControlStatus(this.AddUpdatePanel, false);
         //   EnrolUpdatePanel.Visible = true;
          //  saveLinkButton.Visible = false;
         //   UpdateLinkButton.Visible = false;
         //   PatientGridView.Visible = true;
        }
        
    }
}