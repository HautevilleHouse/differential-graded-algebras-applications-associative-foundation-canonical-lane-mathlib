import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

structure AInfinityAlgebraPackage where
  underlyingGradedModule : Type u
  multiplicationMaps : Nat → Type v
  associativityUpToHomotopy : Prop
  minimalModelRealization : Prop

structure AInfinityAlgebraEvidence (A : AInfinityAlgebraPackage) where
  multiplicationMapsDefined : Prop
  associativityUpToHomotopyClosed : A.associativityUpToHomotopy
  minimalModelRealizationClosed : A.minimalModelRealization

def AInfinityAlgebraClosed (A : AInfinityAlgebraPackage) : Prop :=
  A.associativityUpToHomotopy ∧ A.minimalModelRealization

theorem a_infinity_algebra_closed_from_evidence (A : AInfinityAlgebraPackage)
    (E : AInfinityAlgebraEvidence A) : AInfinityAlgebraClosed A := by
  exact And.intro E.associativityUpToHomotopyClosed E.minimalModelRealizationClosed

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse