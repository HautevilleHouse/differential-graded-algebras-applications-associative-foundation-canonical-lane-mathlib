import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean.DGAAlgebraStructure

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure DerivedPullback (A B C : DGAlgebra ℤ) (f : A → C) (g : B → C) where
  dgaMorphisms : (A → C) ∧ (B → C)
  pullbackAlgebra : DGAlgebra ℤ
  universalProperty : Prop
  exactTriangle : Prop

structure DerivedPullbackEvidence {A B C : DGAlgebra ℤ} {f g} (P : DerivedPullback A B C f g) where
  universalPropertyClosed : P.universalProperty
  exactTriangleClosed : P.exactTriangle
  derivedPullbackClosed : universalPropertyClosed ∧ exactTriangleClosed

def DerivedPullbackClosed {A B C : DGAlgebra ℤ} {f g} (P : DerivedPullback A B C f g) : Prop :=
  P.universalProperty ∧ P.exactTriangle

theorem derived_pullback_closed_from_evidence {A B C : DGAlgebra ℤ} {f g} (P : DerivedPullback A B C f g) (E : DerivedPullbackEvidence P) : DerivedPullbackClosed P :=
  And.intro E.universalPropertyClosed E.exactTriangleClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse
