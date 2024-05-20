pageextension 50200 SalesReceivablesSetupPageExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field("Book Nos."; Rec."Book Nos.")
            {
                Caption = 'Book Nos.';
                ApplicationArea = All;
            }
        }
    }
}