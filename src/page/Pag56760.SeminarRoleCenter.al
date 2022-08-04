page 56760 "Seminar Role Center"
{
    Caption = 'Seminar Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(HeadlineSeminar; "Headline Seminar")
            {
                ApplicationArea = All;
            }
            part(SeminarActivities; "Seminar Activites")
            {
                ApplicationArea = All;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group(Seminar)
            {
                action(Seminars1)
                {
                    Caption = 'Seminars';
                    RunObject = page "Seminar List";
                    ApplicationArea = all;
                    ToolTip = 'Setup your Seminars.';
                }
                action(Customers1)
                {
                    Caption = 'Customers';
                    RunObject = page "Customer List";
                    ApplicationArea = All;
                    Tooltip = 'Setup your customers.';
                }
                action(Contacts)
                {
                    ApplicationArea = All;
                    Caption = 'Contacts';
                    Image = CustomerContact;
                    RunObject = Page "Contact List";
                    ToolTip = 'View a list of all your contacts.';
                }
                action("Semianr Registrations")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Registrations';
                    Image = CustomerContact;
                    RunObject = Page "Seminar Registration List";
                    ToolTip = 'See all the active registartions for Seminars.';
                }
                action("Posted Semianr Registrations")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Seminar Registrations';
                    //Once you have created the posted semianr registrations change this link to point to posted registrations.
                    Image = CustomerContact;
                    RunObject = Page "Seminar Registration List";
                    ToolTip = 'See all the active registartions for Seminars.';
                }
            }
            group(Admin)
            {
                action("Seminar Setup")
                {
                    Caption = 'Seminar Setup';
                    RunObject = page "Seminar Setup";
                    ToolTip = 'Setup the Seminar Module.';
                    ApplicationArea = All;
                }
            }
        }
        area(Creation)
        {
            action("New Seminar")
            {
                Caption = 'New Seminar';
                RunObject = page "Seminar Registration";
                RunPageMode = Create;
                ToolTip = 'Create a new seminar registration.';
                ApplicationArea = All;
            }
        }
        area(Embedding)
        {
            action(Customers)
            {
                ApplicationArea = All;
                Caption = 'Customers';
                Image = Customer;
                RunObject = Page "Customer List";
                ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action(Seminars)
            {
                ApplicationArea = All;
                Caption = 'Seminars';
                Image = BookingsLogo;
                RunObject = page "Seminar List";
                ToolTip = 'View or create some training courses for us.';
            }
        }
    }
}
