permissionset 56702 "Lab4A Starter"
{
    Assignable = true;
    Caption = 'Lab4A Starter', MaxLength = 30;
    Permissions =
        table "Seminar Ledger Entry" = X,
        tabledata "Seminar Ledger Entry" = RMID,
        table "Seminar Journal Line" = X,
        tabledata "Seminar Journal Line" = RMID,
        table "Seminar Register" = X,
        tabledata "Seminar Register" = RMID;
}
