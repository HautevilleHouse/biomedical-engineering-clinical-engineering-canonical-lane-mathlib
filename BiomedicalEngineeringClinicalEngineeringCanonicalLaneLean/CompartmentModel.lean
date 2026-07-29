import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  rateMatrix : Prop
  inputFunction : Prop
  outputConcentration : Prop
  massConservation : Prop
  linearDynamics : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  compartmentsClosed : C.compartments > 0
  rateMatrixClosed : C.rateMatrix
  inputFunctionClosed : C.inputFunction
  outputConcentrationClosed : C.outputConcentration
  massConservationClosed : C.massConservation
  linearDynamicsClosed : C.linearDynamics

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.compartments > 0 ∧ C.rateMatrix ∧ C.inputFunction ∧
  C.outputConcentration ∧ C.massConservation ∧ C.linearDynamics

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C :=
  And.intro E.compartmentsClosed
    (And.intro E.rateMatrixClosed
      (And.intro E.inputFunctionClosed
        (And.intro E.outputConcentrationClosed
          (And.intro E.massConservationClosed E.linearDynamicsClosed))))

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse
