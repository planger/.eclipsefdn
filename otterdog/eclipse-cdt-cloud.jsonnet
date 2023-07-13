local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-cdt-cloud') {
  settings+: {
    default_repository_permission: "none",
    default_workflow_permissions: "write",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_repo_visibility: true,
    members_can_delete_repositories: true,
    name: "Eclipse CDT Cloud",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
  },
  secrets+: [
    orgs.newOrgSecret('OPEN_VSX_TOKEN') {
      value: "pass:bots/ecd.cdt-cloud/open-vsx.org/token",
    },
    orgs.newOrgSecret('VS_MARKETPLACE_TOKEN') {
      value: "pass:bots/ecd.cdt-cloud/marketplace.visualstudio.com/token",
    },
  ],
  _repositories+:: [
    orgs.newRepo('cdt-amalgamator') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('cdt-cloud') {
      allow_update_branch: false,
      description: "Components for web-based C/C++ tools",
      has_discussions: true,
      homepage: "https://www.eclipse.org/cdt-cloud",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "clangd",
        "cloud-ide",
        "cpp",
        "debugging-tools",
        "eclipse-cdt",
        "eclipse-theia",
        "embedded",
        "theia-extension",
        "vscode"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('cdt-cloud-blueprint') {
      allow_update_branch: false,
      default_branch: "master",
      description: "CDT Cloud Blueprint is a template for building custom web-based C/C++ tools. It is made up of existing open source components and can be easily downloaded and installed on all major operating system platforms.",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('cdt-gdb-adapter') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "CDT GDB Debug Adapter",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "cdt",
        "debug",
        "gdb"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('cdt-gdb-vscode') {
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "CDT GDB Visual Studio Code Extension",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "cdt",
        "gdb",
        "visual-studio-code-extension"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_approving_reviews: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('clangd-contexts') {
      allow_update_branch: false,
      description: "API for management of clangd configuration files in C/C++ projects using contexts.",
      has_wiki: false,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "clangd",
        "cpp",
        "theia",
        "vscode-extension"
      ],
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "pass:bots/ecd.cdt-cloud/npmjs.com/token",
        },
      ],
    },
    orgs.newRepo('theia-trace-extension') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Theia trace viewer extension using the tsp-typescript-client (https://github.com/theia-ide/tsp-typescript-client) and Trace Server Protocol (https://github.com/theia-ide/trace-server-protocol).",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "theia-extension",
        "trace",
        "trace-viewer",
        "trace-visualization",
        "tsp"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://discordapp.com/api/webhooks/732801241565888642/k8i2zzlYPFJjgMBKXM-zm4gMPdpWQln3RDvJ6jcUugNUbgRZyOVXEe0FTVCPFQeSjAGW/github') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "pass:bots/ecd.cdt-cloud/npmjs.com/token",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          dismisses_stale_reviews: true,
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('timeline-chart') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "A timeline / gantt chart library for large data (e.g. traces)",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "pass:bots/ecd.cdt-cloud/npmjs.com/token",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('trace-server-protocol') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Specification of the Trace Server Protocol",
      homepage: "https://eclipse-cdt-cloud.github.io/trace-server-protocol/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('tsp-python-client') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Client-side implementation, in Python, of the Trace Server Protocol (TSP) (https://github.com/theia-ide/trace-server-protocol)",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('tsp-typescript-client') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Client-side implementation, in typescript, of the Trace Server Protocol (https://github.com/theia-ide/trace-server-protocol).",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('NPM_AUTH_TOKEN') {
          value: "pass:bots/ecd.cdt-cloud/npmjs.com/token",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vscode-memory-inspector') {
      allow_update_branch: false,
      description: "vscode memory inspector",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('vscode-trace-extension') {
      allow_update_branch: false,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Trace viewer extension for Theia applications and VSCode compatible applications",
      has_discussions: true,
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "theia",
        "trace",
        "trace-viewer",
        "trace-visualization",
        "tsp",
        "typescript",
        "vscode",
        "vscode-extension"
      ],
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          is_admin_enforced: true,
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('vscode-trace-server') {
      allow_update_branch: false,
      description: "Extension to start and stop a trace server used by the vscode-trace-extension. This extension can run in Theia and VSCode compatible applications",
      homepage: "",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "theia",
        "trace",
        "trace-viewer",
        "trace-visualization",
        "tsp",
        "typescript",
        "vscode",
        "vscode-extension"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('vscode-websocket-adapter') {
      allow_update_branch: false,
      has_wiki: false,
      homepage: "https://open-vsx.org/extension/eclipse-cdt/websocket-adapter",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('website') {
      allow_update_branch: false,
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('GH_ACTION_TOKEN') {
          value: "pass:bots/ecd.cdt-cloud/github.com/api-token",
        },
      ],
    },
    orgs.newRepo('website-publish') {
      allow_update_branch: false,
      description: "The acutal published webiste content",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
    },
  ],
}
