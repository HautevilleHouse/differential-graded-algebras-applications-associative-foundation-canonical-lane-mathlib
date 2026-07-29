import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

def DGAClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem dga_endgame (A : AdmissibleClass) :
    DGAClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
