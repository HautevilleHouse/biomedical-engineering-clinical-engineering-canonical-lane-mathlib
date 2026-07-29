import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  rateConstants : List ℝ
  initialConditions : List ℝ
  solutionFormula : String

structure CompartmentModelEvidence (M : CompartmentModel) where
  compartmentsPositive : M.compartments ≥ 1
  rateConstantsLength : M.rateConstants.length = M.compartments * M.compartments
  initialConditionsLength : M.initialConditions.length = M.compartments
  solutionFormulaDefined : M.solutionFormula ≠ ""

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.compartments ≥ 1 ∧
  M.rateConstants.length = M.compartments * M.compartments ∧
  M.initialConditions.length = M.compartments ∧
  M.solutionFormula ≠ ""

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) :
    CompartmentModelClosed M := by
  exact And.intro E.compartmentsPositive
    (And.intro E.rateConstantsLength
      (And.intro E.initialConditionsLength E.solutionFormulaDefined))

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse