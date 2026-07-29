import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DGAlgebraClosed (someProjection A)
  where someProjection (A : AdmissibleClass) : DGAlgebraPackage := by
    exact A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  exact A.object.conclusion

end DifferentialGradedAlgebrasApplicationsAssociativeFoundationCanonicalLaneLean
end HautevilleHouse