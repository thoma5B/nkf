create class Framework extends V;
create property Framework.id string;
create property Framework.parent_id string;
create property Framework.breakdown string;
create property Framework.sign string;
create property Framework.nkf_account string;
create property Framework.label string;
create property Framework.shortcut string;
create property Framework.beneficiary string;
create property Framework.provider string;
alter property Framework.id MANDATORY=true;
alter property Framework.label MANDATORY=true;
alter property Framework.id NOTNULL=true;
alter property Framework.label NOTNULL=true;