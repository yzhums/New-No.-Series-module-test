page 50201 "ZY Book List"
{
    Caption = 'Book List';
    PageType = List;
    SourceTable = "ZY Book";
    ModifyAllowed = false;
    CardPageId = "ZY Book Card";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
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