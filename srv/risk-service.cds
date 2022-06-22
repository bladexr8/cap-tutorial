using { sap.ui.riskmanagement as my } from '../db/schema';

@path: 'service/risk'
service RiskService {
  entity Risks @(restrict: [
    {
      grant: ['READ'],
      to: ['RiskViewer']
    },
    {
      grant: ['*'],
      to: ['RiskManager']
    }
  ]) as projection on my.Risks;
    annotate Risks with @odata.draft.enabled;
  entity Mitigations @(restrict: [
    {
      grant: ['READ'],
      to: ['RiskViewer']
    },
    {
      grant: ['*'],
      to: ['RiskManager']
    }
  ]) as projection on my.Mitigations;
    annotate Mitigations with @odata.draft.enabled;
  entity Contacts @(restrict: [
    {
      grant: ['READ'],
      to: ['RiskViewer']
    },
    {
      grant: ['*'],
      to: ['RiskManager']
    }
  ]) as projection on my.Contacts;
    annotate Contacts with @odata.draft.enabled;
}