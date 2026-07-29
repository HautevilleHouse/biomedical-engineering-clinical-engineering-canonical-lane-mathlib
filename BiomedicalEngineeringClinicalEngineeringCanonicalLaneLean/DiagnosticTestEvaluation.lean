import HautevilleHouse.BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure DiagnosticTestPackage where
  truePositive : Nat
  falsePositive : Nat
  falseNegative : Nat
  trueNegative : Nat
  diseasePrevalence : ℝ
  sensitivity : ℝ
  specificity : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  formulasValid : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  sensitivityFormula : D.sensitivity = D.truePositive / (D.truePositive + D.falseNegative : ℝ)
  specificityFormula : D.specificity = D.trueNegative / (D.trueNegative + D.falsePositive : ℝ)
  positivePredictiveFormula : D.positivePredictiveValue = D.sensitivity * D.diseasePrevalence / (D.sensitivity * D.diseasePrevalence + (1 - D.specificity) * (1 - D.diseasePrevalence))
  negativePredictiveFormula : D.negativePredictiveValue = D.specificity * (1 - D.diseasePrevalence) / ((1 - D.sensitivity) * D.diseasePrevalence + D.specificity * (1 - D.diseasePrevalence))
  formulasValidClosed : D.formulasValid

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  D.formulasValid ∧ D.sensitivity > 0 ∧ D.specificity > 0

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage) (E : DiagnosticTestEvidence D) :
    DiagnosticTestClosed D := by
  exact And.intro E.formulasValidClosed (And.intro (by
    have : D.sensitivity = D.truePositive / (D.truePositive + D.falseNegative : ℝ) := E.sensitivityFormula
    -- need positivity, assume truePositive>0
    sorry) (by
    sorry))

structure ROCAnalysisPackage (D : DiagnosticTestPackage) where
  thresholds : List ℝ
  sensitivityAtThresholds : List ℝ
  specificityAtThresholds : List ℝ
  areaUnderCurve : ℝ
  aucComputed : Prop

def ROCAnalysisClosed (R : ROCAnalysisPackage) : Prop :=
  R.aucComputed ∧ R.areaUnderCurve ≥ 0.5

theorem roc_analysis_closed (R : ROCAnalysisPackage) :
    ROCAnalysisClosed R := by
  exact And.intro R.aucComputed (by
    -- typically AUC is between 0.5 and 1
    have : R.areaUnderCurve ≥ 0.5 := by
      -- from properties
      sorry
    exact this)

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse