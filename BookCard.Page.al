page 50200 "ZY Book Card"
{
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = "ZY Book";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                }
                field("Page Count"; Rec."Page Count")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}