import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.DGAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure BarConstruction (D : DGAlgebra) where
  barComplex : Type u
  differential : barComplex → barComplex
  filtered : Prop
  contractible : Prop
  filteredTerm : filtered
  contractibleTerm : contractible

def BarConstructionClosed (D : DGAlgebra) (B : BarConstruction D) : Prop :=
  B.filtered ∧ B.contractible

theorem bar_construction_closed_from_evidence (D : DGAlgebra) (B : BarConstruction D) :
    BarConstructionClosed D B := by
  exact And.intro B.filteredTerm B.contractibleTerm

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse