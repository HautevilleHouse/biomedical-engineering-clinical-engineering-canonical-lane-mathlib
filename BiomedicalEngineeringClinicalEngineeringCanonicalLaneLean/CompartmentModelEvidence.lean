import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.ClinicalBridgeLemmas

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure CompartmentModelPackage where
  initialDose : ℝ
  volumeDistribution : ℝ
  eliminationRate : ℝ
  timeConstant : ℝ
  drugConcentration : ℝ → ℝ

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.eliminationRate > 0 ∧ C.volumeDistribution > 0

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  initialDoseClosed : C.initialDose > 0
  volumeDistributionClosed : C.volumeDistribution > 0
  eliminationRateClosed : C.eliminationRate > 0
  timeConstantClosed : C.timeConstant > 0

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.eliminationRateClosed E.volumeDistributionClosed

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse