import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure SurvivalAnalysisPackage where
  survivalFunction : Prop
  hazardFunction : Prop
  coxProp : Prop
  proportionalHazards : Prop
  kaplanMeierEstimator : Prop
  censoringIndicator : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  survivalFunctionClosed : S.survivalFunction
  hazardFunctionClosed : S.hazardFunction
  coxPropClosed : S.coxProp
  proportionalHazardsClosed : S.proportionalHazards
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  censoringIndicatorClosed : S.censoringIndicator

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.survivalFunction ∧ S.hazardFunction ∧ S.coxProp ∧
  S.proportionalHazards ∧ S.kaplanMeierEstimator ∧ S.censoringIndicator

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S :=
  And.intro E.survivalFunctionClosed
    (And.intro E.hazardFunctionClosed
      (And.intro E.coxPropClosed
        (And.intro E.proportionalHazardsClosed
          (And.intro E.kaplanMeierEstimatorClosed E.censoringIndicatorClosed))))

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse
