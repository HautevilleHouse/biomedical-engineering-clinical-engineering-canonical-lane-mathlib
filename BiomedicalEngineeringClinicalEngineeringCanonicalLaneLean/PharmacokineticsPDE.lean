import BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure PharmacokineticsPDEPackage (C : CompartmentModelPackage) where
  drugConcentrationField : Type u
  diffusionCoefficient : Type v
  eliminationRate : Type w
  partialDifferentialEquation : Prop
  boundaryConditionsSet : Prop
  wellPosedness : Prop

structure PharmacokineticsPDEEvidence {C : CompartmentModelPackage} (F : PharmacokineticsPDEPackage C) where
  partialDifferentialEquationClosed : F.partialDifferentialEquation
  boundaryConditionsSetClosed : F.boundaryConditionsSet
  wellPosednessClosed : F.wellPosedness

def PharmacokineticsPDEClosed {C : CompartmentModelPackage} (F : PharmacokineticsPDEPackage C) : Prop :=
  F.partialDifferentialEquation ∧ F.boundaryConditionsSet ∧ F.wellPosedness

theorem pharmacokinetics_pde_closed_from_evidence {C : CompartmentModelPackage} (F : PharmacokineticsPDEPackage C) (E : PharmacokineticsPDEEvidence F) : PharmacokineticsPDEClosed F := by
  exact And.intro E.partialDifferentialEquationClosed (And.intro E.boundaryConditionsSetClosed E.wellPosednessClosed)

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse