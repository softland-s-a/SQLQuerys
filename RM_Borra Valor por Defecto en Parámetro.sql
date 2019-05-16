
update
	cwRMParameters
set
	Defaults = ''
where
	ReportName = 'USR_FC_PEND_CLI' and
	Name = 'FCHHAS_PTE'

begin tran
update
	cwRMFields
set
	ParameterDefaults = ''
where
	ReportName = 'USR_STR_MZI_MC' and
	GroupID = '1' and
	FieldID = 'STRMZI_FCHMOV'

commit tran