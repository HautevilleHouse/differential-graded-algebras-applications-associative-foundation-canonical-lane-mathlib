import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DGAlgebraHomology (A : DGAlgebraPackage) where
  cycles : Type u
  boundaries : Type u
  homology : Type u
  cycleInclusion : boundaries → cycles
  quotientMap : cycles → homology
  exactness : ∀ (x : cycles), (∃ (y : A.algebra.carrier), A.algebra.differential y = x) ↔ (cycleInclusion (someBoundary x) = x)
  where someBoundary (x : cycles) : boundaries := sorry
  wellDefined : Prop

def DGAlgebraHomologyPackage (A : DGAlgebraPackage) : Type 1 := Subtype (λ (H : DGAlgebraHomology A) => H.wellDefined)

structure DGAlgebraHomologyPackage' where
  A : DGAlgebraPackage
  H : DGAlgebraHomology A
  wellDefined : H.wellDefined
  finiteDimensional : Prop

structure DGAlgebraHomologyEvidence (P : DGAlgebraHomologyPackage') where
  wellDefinedClosed : P.wellDefined
  finiteDimensionalClosed : P.finiteDimensional

def DGAlgebraHomologyClosed (P : DGAlgebraHomologyPackage') : Prop :=
  P.wellDefined ∧ P.finiteDimensional

theorem dg_algebra_homology_closed_from_evidence (P : DGAlgebraHomologyPackage') (E : DGAlgebraHomologyEvidence P) :
    DGAlgebraHomologyClosed P := by
  exact And.intro E.wellDefinedClosed E.finiteDimensionalClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse