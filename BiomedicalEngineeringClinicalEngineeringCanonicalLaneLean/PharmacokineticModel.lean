import HautevilleHouse.BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ
  initialConcentration : ℝ
  timeDependentConcentration : ℝ → ℝ
  linearOrNonlinear : Prop
  steadyStateReached : Prop
  concentrationEquationValid : Prop

structure CompartmentModelEvidence (P : CompartmentModelPackage) where
  absorptionRatePositive : P.absorptionRate > 0
  eliminationRatePositive : P.eliminationRate > 0
  volumeDistributionPositive : P.volumeDistribution > 0
  concentrationEquationValidClosed : P.concentrationEquationValid

def CompartmentModelClosed (P : CompartmentModelPackage) : Prop :=
  P.absorptionRate > 0 ∧ P.eliminationRate > 0 ∧ P.volumeDistribution > 0 ∧ P.concentrationEquationValid

theorem compartment_model_closed_from_evidence (P : CompartmentModelPackage) (E : CompartmentModelEvidence P) :
    CompartmentModelClosed P := by
  exact And.intro E.absorptionRatePositive (And.intro E.eliminationRatePositive (And.intro E.volumeDistributionPositive E.concentrationEquationValidClosed))

structure PharmacokineticData (P : CompartmentModelPackage) where
  subjectId : String
  doseGiven : ℝ
  concentrationTimePoints : List (ℝ × ℝ)
  fittedParameters : P
  goodnessOfFit : ℝ
  gofThresholdSatisfied : goodnessOfFit ≥ 0.95

def PharmacokineticClosure (D : PharmacokineticData) : Prop :=
  CompartmentModelClosed D.fittedParameters ∧ D.gofThresholdSatisfied

theorem pharmacokinetic_closure_from_data (D : PharmacokineticData) :
    PharmacokineticClosure D := by
  have hModel : CompartmentModelClosed D.fittedParameters := by
    apply compartment_model_closed_from_evidence
    exact ⟨by exact D.fittedParameters.absorptionRate > 0, by exact D.fittedParameters.eliminationRate > 0, by exact D.fittedParameters.volumeDistribution > 0, by exact D.fittedParameters.concentrationEquationValid⟩
  exact And.intro hModel D.gofThresholdSatisfied

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse