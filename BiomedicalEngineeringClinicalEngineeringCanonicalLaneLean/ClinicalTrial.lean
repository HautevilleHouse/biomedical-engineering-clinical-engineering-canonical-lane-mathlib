import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure ClinicalTrialPackage {C : CompartmentModelPackage} {F : PharmacokineticsPDEPackage C} {D : DiagnosticInferencePackage} {S : SurvivalAnalysisPackage} where
  randomizationPerformed : Prop
  blindingApplied : Prop
  sampleSizeCalculated : Prop
  primaryEndpointDefined : Prop

def ClinicalTrialClosed {C : CompartmentModelPackage} {F : PharmacokineticsPDEPackage C} {D : DiagnosticInferencePackage} {S : SurvivalAnalysisPackage} (T : ClinicalTrialPackage) : Prop :=
  T.randomizationPerformed ∧ T.blindingApplied ∧ T.sampleSizeCalculated ∧ T.primaryEndpointDefined

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse