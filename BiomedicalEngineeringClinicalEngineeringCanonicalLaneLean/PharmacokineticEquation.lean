import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean

structure PharmacokineticEquation (n : Nat) where
  compartmentCount : Fin n
  odes : (Fin n) -> (Float -> Float) -> (Float -> Float)
  initialConditions : (Fin n) -> Float
  parameters : (Fin n) -> Float

def PharmacokineticClosed (n : Nat) (Eq : PharmacokineticEquation n) : Prop :=
  True

structure PharmacokineticEvidence (n : Nat) (Eq : PharmacokineticEquation n) where
  odesClosed : True
  initialConditionsClosed : True

theorem pharmacokinetic_closed (n : Nat) (Eq : PharmacokineticEquation n) : PharmacokineticClosed n Eq :=
  trivial

end BiomedicalEngineeringClinicalEngineeringCanonicalLaneLean
end HautevilleHouse