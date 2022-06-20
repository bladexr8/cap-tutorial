namespace sap.ui.riskmanagement;
using { managed } from '@sap/cds/common';

  entity Risks : managed {
    key ID      : UUID  @(Core.Computed : true);
    title       : String(100);
    prio        : String(5);
    descr       : String;
    miti        : Association to Mitigations;
    impact      : Integer;
    criticality : Integer;
  }

  entity Mitigations : managed {
    key ID       : UUID  @(Core.Computed : true);
    description  : String;
    owner        : String;
    timeline     : String;
    risks        : Association to many Risks on risks.miti = $self;
  }

  entity Contacts : managed {
    key ID        : UUID  @(Core.Computed : true);
    AccountName   : String;
    Salutation    : String;
    FirstName     : String;
    LastName      : String;
    Title         : String;
    Department    : String;
    Birthdate     : String;
    Phone         : String;
    MobilePhone   : String;
    Email         : String;
  }
