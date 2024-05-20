table 50200 "ZY Book"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ZYBook: Record "ZY Book";
            begin
                /*if "No." < xRec."No." then begin
                    SalesSetup.Get();
                    NoSeriesMgt.TestManual(SalesSetup."Book Nos.");
                    "No. Series" := '';
                end;*/
                if "No." < xRec."No." then
                    if not ZYBook.Get(Rec."No.") then begin
                        SalesSetup.Get();
                        NoSeries.TestManual(SalesSetup."Book Nos.");
                        "No. Series" := '';
                    end;
            end;
        }
        field(2; Title; Text[30])
        {
            Caption = 'Title';
            DataClassification = CustomerContent;
        }
        field(3; Author; Text[30])
        {
            Caption = 'Author';
            DataClassification = CustomerContent;
        }
        field(4; "Page Count"; Integer)
        {
            Caption = 'Page Count';
            DataClassification = CustomerContent;
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
    begin
        /*if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Book Nos.");
            NoSeriesMgt.InitSeries(SalesSetup."Book Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;*/
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("Book Nos.");
            "No. Series" := SalesSetup."Book Nos.";
            if NoSeries.AreRelated(SalesSetup."Book Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeries: Codeunit "No. Series";
}