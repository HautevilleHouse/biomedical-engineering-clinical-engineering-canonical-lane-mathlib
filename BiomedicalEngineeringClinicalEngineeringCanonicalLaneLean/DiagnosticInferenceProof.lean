import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.PharmacokineticEvidenceTerms

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure DiagnosticInferencePackage where
  truePositive : ℕ
  falsePositive : ℕ
  falseNegative : ℕ
  trueNegative : ℕ
  sensitivity : Prop
  specificity : Prop
  aucROC : ℝ

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.aucROC ≥ 0.5

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  truePositiveClosed : D.truePositive ≥ 0
  falsePositiveClosed : D.falsePositive ≥ 0
  falseNegativeClosed : D.falseNegative ≥ 0
  trueNegativeClosed : D.trueNegative ≥ 0
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  aucROCClosed : D.aucROC ≥ 0.5

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed (And.intro E.specificityClosed E.aucROCClosed)

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse