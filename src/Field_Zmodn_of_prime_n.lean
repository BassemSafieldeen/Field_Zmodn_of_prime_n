import prime
import Zmodn
import Field
import Zmodn_mul_inv_of_prime_n

namespace Zmodn

instance : Field Zmodn :=
{
  equals := equals,
  reflexive_equals := reflexive_equals,
  symmetric_equals := symmetric_equals,
  transitive_equals := transitive_equals,
  add := add,
  mul := mul,
  add_comm := add_comm,
  mul_comm := mul_comm,
  add_assoc := add_assoc,
  mul_assoc := mul_assoc,
  zero := zero,
  add_zero := add_zero,
  one := one,
  mul_one := mul_one,
  add_inv := add_inv,
  mul_inv := mul_inv_of_prime_n,
  distrib := distrib,
}

end Zmodn