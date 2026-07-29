import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : Prop
  specificity : Prop
  prevalence : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  rocCurve : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  prevalenceClosed : D.prevalence
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  rocCurveClosed : D.rocCurve

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.prevalence ∧
  D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.rocCurve

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D :=
  And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.prevalenceClosed
        (And.intro E.positivePredictiveValueClosed
          (And.intro E.negativePredictiveValueClosed E.rocCurveClosed))))

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse
