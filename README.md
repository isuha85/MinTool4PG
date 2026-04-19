
## MinTool4PG 🐘
> **Minimal Tuning Toolkit for PostgreSQL Tuners**

**MinTool4PG**는 Tuner 의 SQL 진단 / 분석을 도와주는 Script 도구로서 터미널(Windwows Terminal) 환경에서 수행됩니다.<br>
WSL 등이 허용되지 않는 윈도우 환경에서도 기존 버전의 Linux Script 와 거의 동일하게 구현하는 것을 목표로 합니다.

---

### 🚀 구현 방향 (예정)

* 반복적으로 사용되는 기본 스크립트는 최소 정보를 빠르게, **적은 비용으로** 추출, 그렇지 않은 경우는 `사람친화적으로` 작성
* 10초(또는 30초) 간격으로 Lock Wait / Active Session 정보 로깅
  * 파일로깅은 가급적 줄바꿈없이 정보가 완성되도록
  * Lock Wait 정보는 `가해자/피해자` 추적을 위해 가급적 상세하게
  * SQL 기반으로 DBMS 의 성능뷰를 통해서 추출하므로, `모니터링 스크립트 자체 부하` 가 적지 않음, 적절한 수행 간격 조정 필요
* 리눅스의 alias 를 cmd.exe 에서는 doskey 로 대응
* **Index Advisor**:
  * 미사용 / 중복 인덱스 식별
  * 인덱스명 힌트 SQL 식별
  * ..
* ..


---

### ⚖️ 라이선스 (License)

이 프로젝트는 **GNU General Public License v3.0 (GPL-3.0)** 을 따릅니다.

  * 2000 년대 후반, ORACLE 버전 최초 작성시에 GPL v3.0 인 [oracle-base.com](https://oracle-base.com) 를 참조했습니다.

### ⚠️ 면책 조항 (Disclaimer)

본 소프트웨어는 **"있는 그대로(AS-IS)"** 제공됩니다.

1. **사전 검증 필수**: SI 프로젝트 수행단계에서 단기간에 다수의 SQL을 검토하는 것을 목표로한 스크립트 입니다. **운영중 DB** 에 대한 적용은 권장하지 않습니다.
1. **책임 제한**: 본 스크립트 실행으로 인해 발생하는 서비스 중단, 성능 저하 등 어떠한 결과에 대해서도 저작자는 법적 책임을 지지 않습니다. 모든 실행의 책임은 사용자 본인에게 있습니다.

