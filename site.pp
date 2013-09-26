import 'manifests/templates'
import 'manifests/nodes'

# Set default path for Exec resources
Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin' }
